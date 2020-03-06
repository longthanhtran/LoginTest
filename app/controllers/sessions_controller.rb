class SessionsController < ApplicationController
  before_action :authenticate, only: :create

  def new
  end

  def create
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
