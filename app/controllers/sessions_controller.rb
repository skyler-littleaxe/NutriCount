class SessionsController < ApplicationController

    def new
        if logged_in?
            redirect_to user_path
        end
    end

    def create
        user = User.find_by(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Invalid credentials. Please try again."
            redirect_to '/login', alert: "Invalid credentials. Plase try again."
        end
    end


    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

end