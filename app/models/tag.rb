class Tag < ApplicationRecord
  belongs_to :tweet, uniqueness: true
  has_many :tweets, through: :tags_tweets
end
