class CommentsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @comments = Comment.all
    render :index
  end

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    render :new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
      respond_to do |format|
        format.html {redirect_to '/'}
        format.js
    end
  end

  def edit
      @comment = Comment.find(params[:id])
      render :edit
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
        format.html {redirect_to '/'}
        format.js
      end
    end

  private
  def comment_params
    params.require(:comment).permit(:comment_title, :comment_body, :user_id)
  end
end
