class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  def authenticate_user
    unless logged_in?
      store_location
      flash[:alert] = 'You have to Log In first!'
      redirect_to login_path
    end
  end
end
