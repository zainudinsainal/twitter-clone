require 'rails_helper'
RSpec.describe Tweet, type: :model do 

it { is_expected.to validate_presence_of(:post) }
it { is_expected.to validate_length_of(:post).is_at_most(140) }

end