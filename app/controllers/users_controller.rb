class UsersController < ApplicationController
    def index
        users=User.all
        render json: users
        end

    def new
    
    end

    def destroy
    
    end

    def show
    
    end

    def update
    
    end
end
