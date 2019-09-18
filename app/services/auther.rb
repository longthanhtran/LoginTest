# frozen_string_literal: true

require 'netaddr'

# Auther handles authentication
class Auther
  def self.authenticate
    authenticate_with_http_basic do |username, password|
      user = User.find_by_email(username)
      return (user &&
              user.authenticate(password) &&
              in_cird_range(user, remote_ip))
    end
  end

  private

  def in_cird_range(user, remote_ip)
    user_subnet = NetAddr::IPv4Net.parse(user.cird)
    user_subnet.contains(NetAddr::IPv4.parse(remote_ip))
  end
end
