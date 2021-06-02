class UsersController < ApplicationController

    def new
        if !logged_in?
            @user = User.new
        else
            flash[:message] = "Invalid credentials. Please try again."
            redirect_to user_path
        end

    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to user_path
        else
            render :new
        end
    end

    def show
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :bio, :weight, :height, :goal)
    end

end
