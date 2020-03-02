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

    context 'with invalid remote ip address' do
      before :each do
        allow_any_instance_of(ActionDispatch::Request).to receive(:remote_addr).and_return('0.0.0.0')
      end

      let(:headers) {
        { HTTP_AUTHORIZATION: "Basic #{Base64.encode64('user1:password')}"}
      }

      let(:user) { create(:user) }
      let(:rule) { create(:rule) }

      it 'verifies against valid user account but from a wrong CIDR' do
        get '/', headers: headers
        expect(response).to have_http_status 401
      end

    end
  end
end
