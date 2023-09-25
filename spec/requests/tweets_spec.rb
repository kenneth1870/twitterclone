# spec/controllers/tweets_controller_spec.rb
require 'rails_helper'

RSpec.describe TweetsController, type: :request do
  let(:user) { create(:user) }
  let(:tweet_params) { attributes_for(:tweet) }

  before(:each) do
    sign_in user
  end

  describe 'POST #create' do
    it 'creates a new tweet' do
      expect do
        post tweets_path(tweet: tweet_params), xhr: true
      end.to change(Tweet, :count).by(1)
    end

    it 'assigns the tweet to the current user' do
      post tweets_path(tweet: tweet_params), xhr: true
      expect(assigns(:tweet).user).to eq(user)
    end
  end

  describe 'PATCH #update' do
    let(:tweet) { create(:tweet, user:) }
    let(:updated_tweet_params) { attributes_for(:tweet, tweet_text: 'Updated tweet') }

    it 'updates the tweet' do
      patch tweet_path(id: tweet.id, tweet: updated_tweet_params), xhr: true
      expect(tweet.reload.tweet_text).to eq('Updated tweet')
    end
  end

  describe 'DELETE #destroy' do
    let(:tweet) { create(:tweet, user:) }

    it 'deletes the tweet' do
      expect do
        delete tweet_path(id: tweet.id), xhr: true
      end.to change(Tweet, :count).by(0)
    end
  end
end
