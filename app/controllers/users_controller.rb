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
        @current_user
    end

    def edit
        if logged_in?
            @current_user
        else
            redirect_to root_path
        end
    end

    def update
        @current_user.update(profile_update_params)
    end

    def edit_credentials
        if logged_in?
            @current_user
        else
            redirect_to root_path
        end
    end

    def update_credentials
        @current_user.update(credentials_update_params)
    end



    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :bio, :weight, :height, :goal)
    end

    def profile_update_params
        params.require(:current_user).permit(:first_name, :last_name, :bio, :weight, :height, :goal)
    end

    def credentials_update_params
        params.require(:current_user).permit(:username, :email, :password, :password_confirmation)
    end

end
