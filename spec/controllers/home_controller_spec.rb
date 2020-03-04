require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  before do
    allow_any_instance_of(HomeController).to(
      receive(:authenticate).and_return(true))
    allow_any_instance_of(HomeController).to(
      receive(:validate_auth_scheme).and_return(true))
  end

  context 'without render_views' do
    describe 'GET home#sign_up' do
      it 'has a 200 status code' do
        get :sign_up
        expect(response).to have_http_status(:ok)
      end
    end
  end

  context 'with render_views' do
    render_views

    it 'gets email text field' do
      get :sign_up
      expect(response.body).to match /Email/im
    end
  end

end