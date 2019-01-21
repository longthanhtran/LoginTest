require 'netaddr'

class CidrValidator < ActiveModel::Validator
  include NetAddr

  def validate(record)
    unless record.cidr.starts_with? '1'
      record.errors[:cidr] << 'Need a valid CIDR string!'
    end
  end
end
