class PrototypesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def update
    current_user.update(user_params)
  end

  def create
    Prototype.create (prototype_params)
  end
end

private
def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept)
end

def user_params
  params.merge(user_id: current_user.id)
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end
