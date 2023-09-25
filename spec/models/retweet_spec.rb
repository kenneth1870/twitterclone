# spec/models/retweet_spec.rb
require 'rails_helper'

RSpec.describe Retweet, type: :model do
  describe 'associations' do
    it { should belong_to(:retweeter).class_name('User') }
    it { should belong_to(:source_tweet).class_name('Tweet') }
  end

  describe 'validations' do
    it { should validate_presence_of(:retweeter) }
  end
end
