class Tweet < ApplicationRecord

  belongs_to :user
  validates :tweets, presence: true, length: { maximum: 140 }

end
