class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(name: params[:user_name])
        if @user.authenticate(params[:user_password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash.alert = "Password is incorrect"
            redirect_to '/'
        end
    end

    def destroy
        reset_session
        redirect_to '/'
    end

end 