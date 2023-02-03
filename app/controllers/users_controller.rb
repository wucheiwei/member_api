class UsersController < ApplicationController
  
    def create
      @user =User.new(user_params)
  
      if @user.save
        redirect_to root_path, notice: "註冊成功"
      #   format.json{render :show,}
      else
        render :new
      end
    end
    
    def login
      @user= User.new
    end
    private
    def user_params
      params.require(:users).permit(:username,:password)
    end
end
