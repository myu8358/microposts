class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path , notice: 'プロフィールを編集しました'
    else
      render 'edit'
    end
  end 
  
  def followings
    @user = User.find(params[:id])
    @users = @user.following_users
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_users
  end 

  def my_favorite
    @user = current_user.follower_users(params[:id])
    @microposts = @user.microspots
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile, :region)

  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
