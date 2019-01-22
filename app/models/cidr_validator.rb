require 'netaddr'

class CidrValidator < ActiveModel::Validator
  include NetAddr

  def validate(record)
    unless NetAddr::IPv4Net.parse(record.cidr)
      record.errors[:cidr] << 'Need a valid CIDR string!'
    end
  end
end
