require 'netaddr'

# Auther handles authentication
module Auther
  extend ActiveSupport::Concern

  AUTH_SCHEME = 'Basic'

  included do
    before_action :validate_auth_scheme
    before_action :authenticate
  end

  def validate_auth_scheme
    unauthorized!('Client Realm') unless
        authorization_request.match?(/#{AUTH_SCHEME} .*/)
  end

  def unauthorized!(realm)
    headers['WWW-Authenticate'] = %(#{AUTH_SCHEME} realm="#{realm}")
    render(status: 401)
  end

  def authorization_request
    @authorization_request ||= request.authorization.to_s
  end

  def authenticate
    authenticate_with_http_basic do |username, password|
      user = User.find_by username: username

      return unauthorized!('Client Realm') unless
          user&.authenticate(password) && in_cidr_range(user, request.remote_ip)
    end
  end

  private

  def in_cidr_range(user, remote_ip)
    user_subnet = NetAddr::IPv4Net.parse(user.rules.first.cidr)
    user_subnet.contains(NetAddr::IPv4.parse(remote_ip.dup))
  end
end
