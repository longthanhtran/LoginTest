require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  context 'without render_views' do
    describe 'GET sign_up#new' do
      it 'has a 200 status code' do
        post :new, { params: { username: 'user1', password: 'password' } }
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'with render_views' do
    render_views

    it 'gets email text field' do
      post :new, { params: { username: 'user1', password: 'password' } }
      expect(response.body).to match /User user1 logged in/im
        # follow_redirect!
    end
  end

end