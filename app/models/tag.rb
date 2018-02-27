class Tag < ApplicationRecord
  belongs_to :tweet, uniqueness: true
end
