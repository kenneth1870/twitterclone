# spec/controllers/home_controller_spec.rb
require 'rails_helper'

RSpec.describe HomeController, type: :request do
  describe 'GET #index' do
    context 'when the user is authenticated' do
      before(:each) do
        @user = create(:user)
        sign_in @user
      end

      it 'returns a successful response' do
        get root_path
        expect(response).to have_http_status(:success)
      end

      it 'assigns @tweets with tweets from friends' do
        friend = create(:user)
        tweet = create(:tweet, user: friend)

        # Make the user follow the friend (create a Relationship)
        create(:relationship, user: @user, friend:)

        get root_path
        expect(assigns(:tweets)).to include(tweet)
      end

      it 'does not include tweets from non-friends' do
        non_friend = create(:user)
        tweet = create(:tweet, user: non_friend)

        get root_path
        expect(assigns(:tweets)).not_to include(tweet)
      end
    end
  end
end
