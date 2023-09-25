# spec/models/tweet_spec.rb
require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:favorites) }
    it { should have_many(:retweets).with_foreign_key('source_tweet_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:tweet_text) }
    it { should validate_length_of(:tweet_text).is_at_most(240) }
  end
end
