# spec/helpers/static_pages_helper_spec.rb
require 'rails_helper'

describe StaticPagesHelper, type: :helper do
  describe '#resource_name' do
    it 'should return :user as the resource name' do
      expect(helper.resource_name).to eq(:user)
    end
  end

  describe '#resource' do
    it 'should return a new User instance' do
      user = helper.resource
      expect(user).to be_a(User)
      expect(user.new_record?).to be(true)
    end
  end

  describe '#devise_mapping' do
    it 'should return the Devise mapping for :user' do
      mapping = helper.devise_mapping
      expect(mapping).to be_a(Devise::Mapping)
      expect(mapping.name).to eq(:user)
    end
  end
end
