require 'rails_helper'
RSpec.describe User, type: :model do 

it { is_expected.to validate_presence_of(:username) }
it { is_expected.to validate_presence_of(:name) }

it 'should validate uniqueness of username' do 
    username = User.new(
      email: "test@test.com",
      encrypted_password: "test",
      name: "Goh",
      username: "Daniel"
    )
    expect(username).to validate_uniqueness_of(:username)
  end 

end