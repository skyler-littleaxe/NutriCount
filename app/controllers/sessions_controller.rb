class SessionsController < ApplicationController

    def new
        if logged_in?
            redirect_to user_path
        end
    end

    def create
        user = User.find_by(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Invalid credentials. Please try again."
            redirect_to '/login', alert: "Invalid credentials. Plase try again."
        end
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to new_user_path
        end
    end


    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end