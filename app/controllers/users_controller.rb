class UsersController < ApplicationController
  before_action :check_for_admin, :only => [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  # FAT MODELS
  # THIN CONTROLLERS 
  # so go to models and add lines to validate

  def create
    @user = User.create user_params # in memorey AND tries
    if @user.save # the @ here is to save the email address, so users won't need to input it again
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
