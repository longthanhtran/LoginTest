require 'rails_helper'

RSpec.describe 'Auther', type: :request do

  describe 'User Authentication' do
    before { get '/' }

    context 'with invalid authentication scheme' do

      it 'gets HTTP status 302 temporary redirect when accessing "/"' do
        expect(response.status).to eq 302
      end

    end
  end

  describe 'Authenticate with sign_in' do
    before { get '/books' }
    context 'without authentication' do
      it 'gets HTTP status 401 Unauthorized' do
        expect(response.status).to eq 401
      end
    end
  end
end