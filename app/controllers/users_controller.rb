class UsersController < ApplicationController
    # Get all users /users

    def index
        users = User.all
        render json: users
    end

    # Get a particular user /user/:id

    def show
            user = User.find(user_params[:id])
        if user
            render json: user
        else
            render json: {error: "User not found" }, status: :not_found
        end
    end

    # create a user Post /user
    def create
        user = User.create(user_params)
        render json: user, status: :created
    end

    private
    def user_params
        params.permit(:first_name, :last_name, :user_name, :email, :id)
    end
end
