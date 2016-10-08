# encoding: utf-8
  class User < ApplicationRecord
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


  acts_as_followable
  acts_as_follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :downcase_fields

   def downcase_fields
      self.nick.downcase!
   end

has_attached_file :avatar,


:path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
:url => "/system/:attachment/:id/:basename_:style.:extension",
:styles => {
  :thumb    => ['120x120#',  :jpg, :quality => 70],
  :preview  => ['480x480#',  :jpg, :quality => 70],
  :large    => ['600>',      :jpg, :quality => 70],
  :retina   => ['1200>',     :jpg, :quality => 30]
},
:default_url => "/images/:style/missing.png"
validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
