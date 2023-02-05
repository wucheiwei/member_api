class ApplicationController < ActionController::API
    def current_user
        @__keep_login__ ||= User.find_by(id: seesion[:keep_login])
      end
      def user_singed_in?
        !!session[:keep_login]
      end
end
