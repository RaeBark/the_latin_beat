class ApplicationController < ActionController::Base

    private

    helper_method :current_user

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authorize
        redirect_to login_path, alert: 'Log in to access songs, ¡por favor!' unless current_user
    end

end
