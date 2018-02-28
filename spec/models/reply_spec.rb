require 'rails_helper'
RSpec.describe Reply, type: :model do 

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:tweet) }
  it { is_expected.to validate_presence_of(:comment) }

end