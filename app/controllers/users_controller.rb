class UsersController < ApplicationController

    def register_user
        user = User.create(user_params)
        if user.valid?
            app_response(
                message: "Registration was successful", 
                status: 201,
                data: user)
        else
            app_response(
                message: "Registration wasnt successful",
                status: :unprocessable_entity,
                data: user.errors
            )
        end
    end

    private

    def user_params
        params.permit(:username, :email, :password)
    end
end
