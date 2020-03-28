# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  def index
    @comments = Comment.all
    redirect_to posts_path
  end

  def show
    redirect_to posts_path
  end

  def new
    @comment = Comment.new
    redirect_to posts_path
  end

  def edit
    redirect_to post_path(@post)
  end

  def create
    @post = Post.find(params[:post_id])
    @pcomment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def find_comment 
    @post = Post.find(params[:id])
    @user_id_from_post = @post.user_id
  end

end
