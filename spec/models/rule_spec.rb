require 'rails_helper'

RSpec.describe Rule, type: :model do
  let(:user) { User.create(username: 'long', password: '123456789') }

  context 'User has association with Rule' do
    it 'with many rules' do
      expect(user.rules).not_to eq(nil)
    end

    it 'has CIDR valid attribute' do
      rule = user.rules.create!(cidr: '172.16.0.0/24')
      expect(rule.cidr).not_to eq(nil)
    end

    it 'has either allow or deny permission' do
      rule = user.rules.create(permission: 'allow')
      expect(rule.permission).not_to eq(nil)
    end

    it 'should validate against CIDR range and permission attribute' do
    end
  end

  subject {
    u = User.new(username: 'long', password: '123456789')
    r = Rule.new(cidr: '192.168.1.0/24', permission: 'allow')
    r.user = u
  }

  let(:rule) { Rule.new(cidr: '192.168.1.0/24', permission: :allow, user: user) }

  it 'is valid with valid attributes' do
    expect(rule).to be_valid
  end

  it 'it not valid without a proper cird' do
    invalid_rule = Rule.create(cidr: '192.168.1.0/33', permission: :allow, user: user)
    expect(invalid_rule).to_not be_valid
  end

  it 'user is valid with correct permission' do
    valid_rule = user.rules.create(cidr: '192.168.1.0/23', permission: :allow)
    expect(user).to be_valid
  end

  it 'is valid as belonging to User' do
    valid_rule = user.rules.create(cidr: '192.168.1.0/23', permission: :allow)
    expect(valid_rule).to be_valid
  end

  it 'is not valid with wrong cidr' do
    invalid_rule = user.rules.create(cidr: '1A.15.90.0/21', permission: :allow)
    expect(invalid_rule).to_not be_valid
  end
end