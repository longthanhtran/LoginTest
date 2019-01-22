require 'rails_helper'

RSpec.describe Rule, :type => :model do
  it 'is valid with valid attributes' do
    u = User.new(username: 'long', password: '123')
    r = Rule.new(cidr: '192.168.1.0/24', permission: 'allow')
    r.user = u
    expect(r).to be_valid
  end

  it 'it not valid without a proper cird' do
    u = User.new(username: 'long', password: '123')
    r = Rule.new(cidr: '192.168.1.0/33')
    r.user = u
    expect(r).to_not be_valid
  end

  it 'is not valid with wrong permission' do
    u = User.new(username: 'long', password: '123')
    r = Rule.new(cidr: '192.168.1.0/24')
    r.user = u
    r.permission = nil
    expect(r).to_not be_valid
  end
end
