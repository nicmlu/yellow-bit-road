class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            login(@user)
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = current_user
        @paths = @user.paths
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
