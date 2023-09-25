# spec/controllers/find_friends_controller_spec.rb
require 'rails_helper'

RSpec.describe FindFriendsController, type: :request do
  describe 'GET #index' do
    context 'when the user is authenticated' do
      before(:each) do
        @user = create(:user)
        sign_in @user
      end

      it 'returns a successful response' do
        get find_friends_path
        expect(response).to have_http_status(:success)
      end

      it 'assigns @users with potential friends' do
        friend = create(:user)
        expect(friend.username).not_to eq(@user.username)

        get find_friends_path
        expect(assigns(:users)).to include(friend)
      end

      it 'does not include current user in @users' do
        get find_friends_path
        expect(assigns(:users)).not_to include(@user)
      end

      it 'does not include existing friends in @users' do
        friend = create(:user)
        @user.friends << friend

        get find_friends_path
        expect(assigns(:users)).not_to include(friend)
      end
    end

    context 'when the user is not authenticated' do
      it 'redirects to the sign-in page' do
        get find_friends_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
