class UsersController < ApplicationController
    def index
        
        render json: User.all
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))

        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        if user
            render json: user
        else
            render plain: "User not found #{params[:id]}", status: :unprocessable_entity
        end
    end

    def destroy
      User.find(params[:id]).destroy
    end

    def update
      user = User.find(params[:id])


      if user.update(params.require(:user).permit(:name, :email))
          render plain: "User updated"
      else
          render plain: "User failed to update", status: 400
      end
    end

end