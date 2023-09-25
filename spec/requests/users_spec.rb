# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get user_path(id: user.id)
      expect(response).to render_template('show')
    end

    it 'assigns the user tweets' do
      create(:tweet, user:)
      get user_path(id: user.id)
      expect(assigns(:tweets)).to_not be_empty
    end
  end

  describe 'GET #followers' do
    it 'renders the followers template' do
      get followers_user_path(id: user.id)
      expect(response).to render_template('followers')
    end
  end

  describe 'GET #following' do
    it 'renders the following template' do
      get following_user_path(id: user.id)
      expect(response).to render_template('following')
    end
  end

  describe 'GET #favorites' do
    it 'renders the favorites template' do
      get favorites_user_path(id: user.id)
      expect(response).to render_template('favorites')
    end
  end

  describe 'GET #retweets' do
    it 'renders the retweets template' do
      get retweets_user_path(id: user.id)
      expect(response).to render_template('retweets')
    end
  end
end
