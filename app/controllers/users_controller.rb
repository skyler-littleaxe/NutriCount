class UsersController < ApplicationController
    before_action :logged_in?, :redirect_if_not_logged_in, only: [:show, :edit, :update, :edit_credentials, :update_credentials]

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
            redirect_to user_path(user)
        else
            render :new
        end
    end

    def show
    end

    def edit
        
    end

    def update
        if @current_user.update(profile_update_params)
            redirect_to user_path(@current_user)
        else
            render :edit
        end
    end

    def edit_credentials
        
    end

    def update_credentials
        if @current_user.update(credentials_update_params)
            redirect_to user_path(@current_user)
        else
            render :edit
        end
    end



    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name, :bio, :weight, :height, :goal, :lifestyle)
    end

    def profile_update_params
        params.require(:user).permit(:first_name, :last_name, :bio, :weight, :height, :goal, :lifestyle)
    end

    def credentials_update_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to root_path
        end
    end


    
end
