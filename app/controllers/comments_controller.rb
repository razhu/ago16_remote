class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      if @comment.save
        format.html {redirect_to article_comments_path, notice: "comment created"}
      else
        format.html {render :new}
      end

    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user = User.update(user_params)
        format.html{ redirect_to @user, notice: "user updated"}
      else
        format.html{ render :show}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html{redirect_to users_path, notice: "element destroyed"}
    end
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name)
  end
end
