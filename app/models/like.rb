class Like < ApplicationRecord

  belongs_to :tweet, uniqueness: true
  belongs_to :user, uniqueness: true
end
