class CommentsController < ApplicationController
  before_action :logged_in_user

  def show
    @user = current_user
    @entry = Entry.find_by(id: params[:id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
    else
      flash[:danger] = "Comment can not be blank"
    end
    redirect_to :back
  end

  private
  def comment_params
    params.require(:comment)
        .permit(:content, :user_id, :entry_id)
  end
end