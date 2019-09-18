class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(id: session['user.id']) if session['user.id']
  end

  def sign_in; end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      puts "The username : #{username}"
    end
    redirect_to '/sign-in' unless current_user
  end
end
