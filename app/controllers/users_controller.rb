class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    respond_to do |format|
    if @user.save
      format.html {redirect_to @user, notice: "user created"}
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
