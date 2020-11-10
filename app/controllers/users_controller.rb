
class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            # binding.pry
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        if params[:id].to_i == session[:user_id]
            @user = User.all.find_by_id(params[:id])
        else
            redirect_to '/'
        end
    end

    def edit
    end

    def update

    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

end