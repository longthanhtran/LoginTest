require 'ipaddr'

class CidrValidator < ActiveModel::Validator

  def validate(record)
    begin
      IPAddr.new(record.cidr)
    rescue IPAddr::InvalidAddressError => e
      record.errors[:cidr] << 'Need a valid CIDR string!'
    end
  end
end
