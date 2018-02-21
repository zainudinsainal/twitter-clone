class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.role == "admin"
  end

  has_many :tweets
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  mount_uploader :image, ImageUploader
  has_many :likes
  has_many :replies


  has_many :active_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :passive_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy

  has_many :followings, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower

  

end
