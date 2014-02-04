class CommentsController < ApplicationController
  def create
    @commentable = Comment.find_commentable(params[:comment][:commentable_type], params[:comment][:commentable_id])
    if @commentable
      @comment = @commentable.comments.build(params[:comment])
      @comment.user_id = current_user.id
      if @comment.save
        redirect_to show_page_url, :notice => "Komentarz zostal dodany."
      else
        flash.now[:alert] = "Podczas dodawania komentarza wystapily bledy."  # edited 10/28/10 use 'flash.now' instead of 'flash'
        render_error_page
      end
    else
      redirect_to root_url, :alert => "Oops!"
    end
  end
  
  private
  
  def show_page_url
    case @commentable.class.name
    when "Post" then post_url(@commentable.sequence)
    else @commentable
    end
  end
  
  def render_error_page
    model_name = @commentable.class.name
    instance_variable_set("@#{model_name.downcase}", @commentable)
    render "#{model_name.underscore.downcase.pluralize}/show"
  end
end
