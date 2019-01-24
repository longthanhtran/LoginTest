require 'rails_helper'

RSpec.describe Rule, :type => :model do
  subject {
    u = User.new(username: 'long', password: '123')
    r = Rule.new(cidr: '192.168.1.0/24', permission: 'allow')
    r.user = u
  }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'it not valid without a proper cird' do
    @user = User.create(username: 'long', password: '123')
    @rule = @user.rules.create(cidr: '192.168.1.0/33', permission: :allow)
    expect(@rule).to_not be_valid
  end

  it 'is not valid with wrong permission' do
    @user = User.create(username: 'long', password: '123')
    @rule = @user.rules.create(cidr: '192.168.1.0/23', permission: :allow)
    @rule.permission = :allow
    expect(@rule).to be_valid
  end

  it 'is valid as belonging to User' do
    @user = User.create(username: 'long', password: '123')
    @rule = @user.rules.create(cidr: '192.168.1.0/23', permission: :allow)
    expect(@rule).to be_valid
  end
end
