require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:question) }
    it { should have_many(:votes) }
  end
end
