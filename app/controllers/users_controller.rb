class UsersController < ApplicationController
    def index

    end
    def create
      @user =User.new(user_params)
    
      if @user.save
        render json: {susses: true}
      else
        render json:{susses: false}
      end
    
    end
    
    def login
      @user= User.new
    end
    private
    def user_params
      params.require(:user).permit(:username,:password)
    end
end
