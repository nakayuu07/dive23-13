require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe 'associations' do
    it { should belong_to(:question) }
    it { should belong_to(:tag) }
  end
end
