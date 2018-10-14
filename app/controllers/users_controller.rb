class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:following, :followers]
  def show
      @user = User.find_by(id: params[:id])
      @microposts = @user.microposts
  end

  def following
    @title = "Following"
    @user = User.find_by(id: params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find_by(id: params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
