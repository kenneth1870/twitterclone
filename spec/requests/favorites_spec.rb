# spec/requests/favorites_controller_spec.rb
require 'rails_helper'

RSpec.describe 'FavoritesController', type: :request do
  describe 'POST /favorites' do
    context 'when the user is authenticated' do
      before(:each) do
        @user = create(:user)
        sign_in @user
        @tweet = create(:tweet, user: @user)
      end

      it 'creates a favorite for the current user via HTTP request' do
        post favorites_path(tweet_id: @tweet.id), xhr: true
        expect(response).to have_http_status(:success)
        expect(Favorite.last.user).to eq(@user)
        expect(Favorite.last.tweet).to eq(@tweet)
      end
    end
  end

  describe 'DELETE /favorites/:id' do
    context 'when the user is authenticated' do
      before(:each) do
        @user = create(:user)
        sign_in @user
        @tweet = create(:tweet, user: @user)
        @favorite = create(:favorite, tweet: @tweet, user: @user)
      end

      it 'deletes the favorite via HTTP request' do
        delete favorite_path(@favorite), xhr: true
        expect(response).to have_http_status(:success)
        expect(Favorite.exists?(@favorite.id)).to be(false)
      end
    end
  end
end
