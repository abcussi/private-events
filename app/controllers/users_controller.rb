class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:user][:name], email: params[:user][:email],
                     password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
    if @user.save
      redirect_to user_path(@user)
      login(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
