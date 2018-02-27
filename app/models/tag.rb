class Tag < ApplicationRecord
  validates :content, presence: true, uniqueness: true
  has_many :tags_tweets
  has_many :tweets, through: :tags_tweets
end
