class UsersController < ApplicationController

  include UsersHelper

  before_action :authenticate_user, except: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.upcoming_events
    @recent_events = @user.recent_events
  end

  def past_events
    @user = User.find(params[:id])

    unless is_requested_user?
      flash[:alert] = "You do not have permission to view this page!"
      redirect_to @user
    end
    @past_events = @user.past_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User successfully created"
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was an error while creating the User"
      render 'new'
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :address)
  end

end
