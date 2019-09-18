require 'rails_helper'

RSpec.describe 'Auther', type: :request do

  describe 'User Authentication' do
    before { get '/', headers: headers }

    context 'with invalid authentication scheme' do
      let(:headers) { { HTTP_AUTHORIZATION: '' } }

      it 'gets HTTP status 401 Unauthorized' do
        expect(response.status).to eq 401
      end
    end

    context 'with valid authentication scheme' do
      let(:headers) {
        { HTTP_AUTHORIZATION: "Basic #{Base64.encode64('user1:password')}"}
      }

      let(:user) { create(:user) }
      let(:rule) { create(:rule) }

      it 'verifies against valid user account' do
        expect(response).to have_http_status 200
      end
    end
  end
end