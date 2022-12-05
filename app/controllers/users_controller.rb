class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :error_message

    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            render json: user, status: :created
        else
            render json:{error: user.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(session[:user_id])
        render json: user, status: 200
    end

    def destroy 
        user = User.find(session[:user_id])
        user.destroy
        head :no_content
    end


    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end

    def error_message
        render json: {error: "User not found"}, status: 401
    end
end
