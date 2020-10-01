class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
      login(@user.id)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @attended_event = Event.all
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
