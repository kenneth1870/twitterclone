# spec/models/favorite_spec.rb
require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'associations' do
    it { should belong_to(:tweet) }
    it { should belong_to(:user) }
  end
end
