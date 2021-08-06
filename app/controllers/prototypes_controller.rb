class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @users = User.all
  end

  def new
    @prototype = Prototype.new
  end

  def update
    current_user.update(user_params)
  end
end

private

def user_params
  params.require(:user).permit(:name, :email)
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end
