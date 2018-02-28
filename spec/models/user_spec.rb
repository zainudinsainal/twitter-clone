require 'rails_helper'
RSpec.describe User, type: :model do 

it { is_expected.to have_many(:tweets) }
it { is_expected.to validate_presence_of(:username) }
it { is_expected.to validate_presence_of(:name) }
it { is_expected.to have_many(:likes) }
it { is_expected.to have_many(:replies) }
it { is_expected.to have_many(:active_relationships).with_foreign_key('follower_id') }
it { is_expected.to have_many(:passive_relationships).with_foreign_key('following_id') }
it { is_expected.to have_many(:followings).through(:active_relationships) }
it { is_expected.to have_many(:followers).through(:passive_relationships) }

it 'should validate uniqueness of username' do 
    username = User.new(
      email: "test@test.com",
      encrypted_password: "test",
      name: "Goh",
      username: "Daniel"
    )
    expect(username).to validate_uniqueness_of(:username)
  end 

it 'display admin when #admin? is called' do 
  admin = User.new(
    email: "test@test.com",
    encrypted_password: "test",
    name: "Goh",
    username: "Daniel",
    role: "admin"
  )
  expect(admin.admin?).to eq true
end 

it 'display admin when #admin? is called' do 
  admin = User.new(
    email: "test@test.com",
    encrypted_password: "test",
    name: "Goh",
    username: "Daniel",
    role: " "
  )
  expect(admin.admin?).to eq false
end

end