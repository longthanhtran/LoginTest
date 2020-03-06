require 'rails_helper'

RSpec.describe 'Auther', type: :request do

  describe 'User Authentication' do

    context 'with valid username and password' do
      let(:user) { create(:user) }
      let(:rule) { create(:rule) }

      it 'verifies against valid user account' do
        post "/sessions", params: { username: 'user1', password: 'password' }
        expect(response).to redirect_to(:login)
        follow_redirect!

        expect(response).to have_http_status(:ok)
      end
    end

    context 'with valid username and password' do
      let(:user) { create(:user) }
      let(:rule) { create(:rule) }

      it 'verifies user view after login' do
        post "/sessions", params: { username: 'user1', password: 'password' }
        expect(response).to redirect_to(:login)
        follow_redirect!

        #expect(response).to render_template("home/index")

        expect(response.body).to include("User user1 logged in")
      end
    end

    xcontext 'with invalid username and password' do
      let(:user) { create(:user) }
      let(:rule) { create(:rule) }

      it 'verifies against invalid user account' do
        post "/sessions", params: { username: 'user2', password: 'password' }
        expect(response).to have_http_status 302
      end
    end

    xcontext 'with invalid remote ip address' do
      before :each do
        allow_any_instance_of(ActionDispatch::Request).to receive(:remote_addr).and_return('0.0.0.0')
      end

      let(:user) { create(:user) }
      let(:rule) { create(:rule) }

      it 'verifies against valid user account but from a wrong CIDR' do
        post '/sessions', params: { username: 'user2', password: 'password' }
        expect(response).to have_http_status 302
      end

    end
  end
end
