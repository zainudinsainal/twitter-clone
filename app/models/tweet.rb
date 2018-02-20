class Tweet < ApplicationRecord

  belongs_to :user
  validates :post, presence: true, length: { maximum: 140 }
  has_many :likes

end
