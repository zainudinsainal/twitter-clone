class Reply < ApplicationRecord

  belongs_to :user
  belongs_to :tweet
  has_many :likes
  validates :comment, presence: true
end
