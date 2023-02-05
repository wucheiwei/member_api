class SessionsController < ApplicationController
    def create
        username = params[:username]
        password = params[:password]
        hashed_password = Digest::SHA1.hexdigest(password)
    
        user = User.find_by(username: username, password: hashed_password)
        if user
          session[:keep_login]= username
          render json: {susses: true}
        else
          render json: {susses: false}
        end
    
      end
    
      def destory
        session[:keep_login]= nil
        redirect_to root_path, notice: "已登出"
      end
end
