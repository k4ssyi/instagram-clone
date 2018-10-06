class UsersController < ApplicationController
  def show
      @user = User.find_by(id: params[:id])
      @microposts = @user.microposts
  end
end
