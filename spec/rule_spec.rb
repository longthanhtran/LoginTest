require 'rails_helper'

describe Rule do

  describe '.add' do
    context 'has a valid cird' do
      it 'accept new rule' do
        expect(Rule.new(cidr: '1')).to be_valid
      end
    end
  end
end
