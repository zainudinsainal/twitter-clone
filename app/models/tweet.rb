class Tweet < ApplicationRecord

  belongs_to :user
  validates :post, presence: true, length: { maximum: 140 }
  has_many :likes
  has_many :replies

  has_many :tags_tweets
  has_many :tags, through: :tags_tweets

end
