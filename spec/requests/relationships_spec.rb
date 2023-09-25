# spec/controllers/relationships_controller_spec.rb
require 'rails_helper'

RSpec.describe RelationshipsController, type: :request do
  describe 'POST #create' do
    context 'when the user is authenticated' do
      before(:each) do
        @user = create(:user)
        @friend = create(:user)
        sign_in @user
      end

      it 'creates a relationship between the user and friend' do
        expect do
          post relationships_path(friend_id: @friend.slug), xhr: true
        end.to change(Relationship, :count).by(1)

        expect(@user.friends).to include(@friend)
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when the user is authenticated' do
      before(:each) do
        @user = create(:user)
        @friend = create(:user)
        @relationship = create(:relationship, user: @user, friend: @friend)
        sign_in @user
      end

      it 'deletes the relationship between the user and friend' do
        expect do
          delete relationship_path(@relationship), xhr: true
        end.to change(Relationship, :count).by(-1)

        expect(@user.friends).not_to include(@friend)
      end
    end
  end
end
