require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:answers) }
    it { should have_many(:votes) }
    it { should have_many(:favorites) }
    it { should have_many(:taggings) }
    it { should have_many(:tags) }
  end
end
