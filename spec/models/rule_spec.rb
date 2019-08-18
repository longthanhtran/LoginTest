require 'rails_helper'

RSpec.describe Rule, type: :model do
  let(:user) { User.create(username: 'long', password: '123456789') }
  let(:rule) { Rule.create(cidr: '192.168.1.0/24', permission: :allow, user: user) }

  context 'User has association with Rule' do
    it 'with many rules' do
      expect(user.rules).to eq([rule])
    end

    it 'has CIDR valid attribute' do
      expect(rule.cidr).not_to be nil
    end

    it 'can have permission :allow' do
      rule = user.rules.create(cidr: '192.168.1.0/24', permission: :allow)
      expect(rule).to be_valid
    end

    it 'can have permission :deny' do
      rule = user.rules.create(cidr: '192.168.1.0/24', permission: :deny)
      expect(rule).to be_valid
    end

    it 'can not have any other permission' do
      expect {
        Rule.new(cidr: '192.168.1.0/24', permission: 'something_else')
      }.to raise_error(ArgumentError, "'something_else' is not a valid permission")
    end

    it 'should validate against CIDR range and permission attribute' do
    end
  end

  it 'is valid with valid attributes' do
    expect(rule).to be_valid
  end

  it 'it not valid without a proper cidr' do
    invalid_rule = Rule.create(cidr: '192.168.1.0/33', permission: :allow, user: user)
    expect(invalid_rule).to_not be_valid
  end

  it 'user is valid with correct permission' do
    user.rules.create(cidr: '192.168.1.0/23', permission: :allow)
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
