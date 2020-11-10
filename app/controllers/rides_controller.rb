class RidesController < ApplicationController

    def new

    end

    def create
        @ride = Ride.new(ride_params)
        alert = @ride.take_ride
        redirect_to user_path(session[:user_id]), notice: alert
    end

    private

    def ride_params
        params.require(:ride).permit(:user_id, :attraction_id)
    end

end 