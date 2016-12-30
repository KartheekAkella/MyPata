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
         :recoverable, :rememberable, :trackable, :validatable
  before_save :downcase_fields

   def downcase_fields
      self.nick.downcase!
   end
 #mount_uploader :avatar, AvatarUploader
end
