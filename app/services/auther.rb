require 'ipaddr'

module Auther
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :remote_ip, :user_rules
  end

  def authenticate
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password]) && allow_to_login?(user)
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged In!"
    else
      flash.now.alert = "Email or password is invalid"
      redirect_to login_url
    end
  end

private

  def allow_to_login?(user)
    current_ip = IPAddr.new(request.remote_ip)
    user_rules = user.rules.map { |rule| { cidr: IPAddr.new(rule.cidr), permission: rule.permission } }
    user_rules.any? { |rule| rule[:cidr].include?(current_ip) && rule[:permission] == 'allow' }
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def remote_ip
    request.remote_ip
  end

  def user_rules
    current_user.rules.map do |rule|
      { cidr: rule.cidr, permission: rule.permission }
    end
  end

end
