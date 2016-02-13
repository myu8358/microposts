class ConnectionsController < ApplicationController
    before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.favorite(@user)
  end

  def destroy
    @user = current_user.favor_connections.find(params[:id]).favored
    current_user.unfavorite(@user)
  end
end

