require 'rails_helper'

RSpec.describe Rule, type: :model do
  context 'User has association with Rule' do
    it 'with many rules' do
      user = User.create!

      expect(user.rules).not_to eq(nil)
    end
    
    it 'has CIDR check' do
    end
    
    it 'has permission attribute' do
    end
    
    it 'should validate against CIDR range and permission attribute' do
    end
  end
end