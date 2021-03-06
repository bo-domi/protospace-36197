class CommentsController < ApplicationController

  def create
    @prototype = Prototype.find(params[:prototype_id] || params[:id])
    @comments = @prototype.comments.includes(:user)
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype.id)
     else
      render "prototypes/show"
     end
   
  end

  private
  def comment_params
  params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
