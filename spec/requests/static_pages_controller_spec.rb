# spec/controllers/static_pages_controller_spec.rb
require 'rails_helper'

RSpec.describe StaticPagesController, type: :request do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
