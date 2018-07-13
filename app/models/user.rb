class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, dependent: :destroy
    # this next statement tricks ruby into converting the text value of following to an array
    
  serialize :following, Array


  mount_uploader :avatar, AvatarUploader

  validates :username, presence: true
  validates :username, uniqueness: true



end
