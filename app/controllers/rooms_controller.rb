class RoomsController < ApplicationController

    def index
    rooms=Room.all
    render json: rooms, include:[:likes, :user]
    end

    def create
        room = Room.create(room_params)
        render json: room, include:[:likes, :user]
    end

    private

    def room_params
        params.require(:room).permit(:user_id, :name, :description, :img_url, :pvt)
    end

end
