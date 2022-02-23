class UsersController < ApplicationController
    # get all users /users

    def index
        users = User.all
        render json: users
    end

    # get a particular user /user/:id

    def show
            user = User.find(user_params[:id])
        if user
            render json: user
        else
            render json: {error: "User not found" }, status: :not_found
        end
    end

    private
    def user_params
        params.permit(:first_name, :last_name, :user_name, :email, :id)
    end
end
