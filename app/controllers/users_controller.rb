class UsersController < ApplicationController
  before_action :authenticate_user, except: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "User successfully created"
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
