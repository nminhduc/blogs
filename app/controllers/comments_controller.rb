class CommentsController < ApplicationController
    
  def create
       @comment = current_user.comments.build
       @comment.update_attributes comment_params
       @comment.update_attributes(entry_id: params[:entry_id])
    if @comment.save
       flash[:success] = "Comment created!"
       redirect_to @comment.entry
    else
      render 'static_pages/home'
    end
  end
  def new
      @comment = Comment.new
  end
    def index
    @comments = User.paginate(page: params[:page])
  end
end

private 
def comment_params
  params.require(:comment).permit(:content)
end