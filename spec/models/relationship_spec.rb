# spec/models/relationship_spec.rb
require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:friend).class_name('User') }
  end

end
