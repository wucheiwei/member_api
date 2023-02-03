class SessionsController < ApplicationController
    def create
        username = params[:username]
        password = params[:password]
        hashed_password = Digest::SHA1.hexdigest(password)
    
        User.where(username: username,password: hashed_password)
        if user
          session[:keep_login]= user.id
          redirect_to root_path, notice: "登入成功"
        else
          redirect_to login_users_path, alert: "登入失敗"
        end
    
      end
    
      def destory
        session[:keep_login]= nil
        redirect_to root_path, notice: "已登出"
      end
end
