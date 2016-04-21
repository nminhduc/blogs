class ComentsController < ApplicationController
 def create
    @entry = Entry.find(params[:entry_id])
    byebug
    @comment = Comment.create(params[:comment])
    @comment.entry = @entry
    @comment.user = current_user
    if @comment.save
       flash[:success] = "Comment created!"
       redirect_to current_user
    else
      render 'shared/_comment_form'
    end
  end
  def new
    @coment = Coment.new
  end
  def index
     @coment = Coment.new
   end
end
