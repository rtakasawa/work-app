class SessionsController < ApplicationController
  before_action :loggin_in_check, only: [:new]

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to blogs_path, notice: 'ログインに成功しました！'
    else
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end

  private
  def loggin_in_check
    redirect_to blogs_path if logged_in?
  end
end
