class UsersController < ApplicationController
  def show
  @user = User.find(params[:user_id] || params[:id])
  @nickname = current_user.nickname
  @prototypes = current_user.prototypes
  end
end