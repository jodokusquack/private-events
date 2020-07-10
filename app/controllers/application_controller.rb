class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  def authenticate_user
    unless logged_in?
      store_location
      flash[:alert] = 'Please log in.'
      redirect_to login_path
    end
  end
end
