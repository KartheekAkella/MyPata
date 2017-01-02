# encoding: utf-8
  class User < ApplicationRecord
    mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :phones
  has_many :emails
  has_many :works
  has_many :educations
  has_one :social_info
  has_one :hashtag
  has_many :interests
  has_many :labels
  has_many :contacts

  acts_as_followable
  acts_as_follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  #before_save :downcase_fields
  


def self.from_omniauth(auth)
  if self.where(email: auth.info.email).exists?
    return_user = self.where(email: auth.info.email).first
    return_user.provider = auth.provider
    return_user.uid = auth.uid
  else
    return_user = self.create do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       user.avatar = auth.info.image
       
       user.nick = auth.info.name
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
    end
  end

  return_user
end
   #def downcase_fields
   #  self.nick.downcase!
   #end
 #mount_uploader :avatar, AvatarUploader
end
