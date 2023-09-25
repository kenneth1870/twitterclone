# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:tweets) }
    it { should have_many(:relationships) }
    it { should have_many(:friends).through(:relationships) }
    it { should have_many(:inverse_relationships).class_name('Relationship').with_foreign_key('friend_id') }
    it { should have_many(:inverse_friends).through(:inverse_relationships).source(:user) }
    it { should have_many(:favorites) }
    it { should have_many(:retweets).with_foreign_key('retweeter_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(100) }
    it { should validate_presence_of(:username) }
    it { should validate_length_of(:username).is_at_most(20) }
    it { should validate_uniqueness_of(:username).case_insensitive }
  end

  describe 'devise modules' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  it 'is valid with valid attributes' do
    user = User.new(name: 'John Doe', username: 'johndoe', email: 'johndoe@example.com', password: 'password')

    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = User.new(username: 'johndoe', email: 'johndoe@example.com', password: 'password')

    expect(user).to_not be_valid
  end
end
