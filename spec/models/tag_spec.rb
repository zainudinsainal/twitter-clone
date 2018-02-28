require 'rails_helper'
RSpec.describe Tag, type: :model do 

it { is_expected.to validate_presence_of(:content) }
it { is_expected.to have_many(:tags_tweets) }
it { is_expected.to have_many(:tweets).through(:tags_tweets) }

it 'should validate uniqueness of content' do 
    content = Tag.new(
      content: "test"
    )
    expect(content).to validate_uniqueness_of(:content)
  end 

end