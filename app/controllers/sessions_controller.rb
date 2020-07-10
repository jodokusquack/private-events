class SessionsController < ApplicationController
  def new
  end

  def create
    # find the user from email
    @current_user = User.find_by(email: params[:session][:email])

    if @current_user
      session[:user_id] = @current_user.id
      flash[:success] = "Successfully logged in."
      redirect_back_or @current_user
    else
      flash[:alert] = "No User with that Email exists!"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil

    flash[:success] = "Successfully logged out."

    redirect_to :root
  end
end
