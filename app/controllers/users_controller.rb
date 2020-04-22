class UsersController < ApplicationController
  # before_action :loggin_in_check
  before_action :set_params, only: [:show]
  def new
    @user = User.new
  end

  def show
    @blogs = current_user.favorite_users.all
    @blogs_count = current_user.favorite_users.count
  end

  def create
    @user = User.new(params_user)
    if @user.save
      session[:user_id] = @user.id
      redirect_to blogs_path, notice: '登録に成功しました！'
    else
      render :new
    end
  end

  private
  def params_user
    params.require(:user).permit(:name,:email, :password, :password_confirmation)
  end

  def loggin_in_check
    # redirect_to blogs_path if logged_in?
  end

  def set_params
    @user = User.find(params[:id])
  end

end
