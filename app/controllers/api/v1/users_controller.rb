class Api::V1::UsersController < ApplicationController

    def index 
        @users = User.all
        render json: @users
    end

    def create
        @user = User.create(user_params)
        if @user.valid? 
            token = JWT.encode({user_id: @user.id}, "my_secret_key")    
            render json: { user: @user, jwt: token}, status: :created
        else
            render json: { message: "couldn't signup"}, status: :not_acceptable
        end
    end

    def show 
        render json: current_user
    end

    private
    def user_params 
        params.require(:user).permit(:username, :password, :bio, :avatar)
    end
end
