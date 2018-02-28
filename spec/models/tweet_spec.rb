require 'rails_helper'
RSpec.describe Tweet, type: :model do 

it { is_expected.to belong_to(:user) }
it { is_expected.to validate_presence_of(:post) }
it { is_expected.to validate_length_of(:post).is_at_most(140) }
it { is_expected.to have_many(:likes) }
it { is_expected.to have_many(:replies) }
it { is_expected.to have_many(:tags_tweets) }
it { is_expected.to have_many(:tags).through(:tags_tweets) }

end