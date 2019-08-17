require 'rails_helper'

RSpec.describe Rule, type: :model do
  context 'User has association with Rule' do
    it 'with many rules' do
      user = User.create!

      expect(user.rules).not_to eq(nil)
    end

    it 'has CIDR valid attribute' do
      user = User.create!
      rule = user.rules.create!(cidr: '172.16.0.0/24')

      expect(rule.cidr).not_to eq(nil)
    end

    it 'has either allow or deny permission' do
      user = User.create!
      rule = user.rules.create(permission: 'allow')

      expect(rule.permission).not_to eq(nil)
    end

    it 'should validate against CIDR range and permission attribute' do
    end
  end
end