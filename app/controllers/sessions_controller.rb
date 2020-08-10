class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(id: params[:session][:user_id])
    if @user
      login(@user.email)
      redirect_to user_path(@user.id)
    else
      flash.now[:message] = 'Incorrect'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
