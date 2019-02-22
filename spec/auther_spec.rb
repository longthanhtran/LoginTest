require_relative '../app/services/auther'
require 'spec_helper'
require 'rails_helper'
# require './auther_helper'

# RSpec.configure do |c|
#   c.include AutherHelper
# end

RSpec.describe Auther do
  it 'receives a pair or username and password' do
    expect(Auther::authenticate('long', '123')).to be_nil
  end

  it 'can verify valid user name'
  it 'only accepts strong password' do
    @user = User.new password: '123', password_confirmation: '123'
    expect(@user.save).to_not be_valid
  end

  #
  # it 'has access to the helper methods defined in the module' do
  #   expect(help).to be(:available)
  # end
end
