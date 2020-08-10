class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(id: parms[:session][:user_id])
        if @user
            redirect_to user_path(@user.id)
            login(@user.id)
        else
            flash.now[:message] = 'Incorrect'
            render 'new'
        end
    end
end
