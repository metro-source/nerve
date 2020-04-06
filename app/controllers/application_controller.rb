class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :current_user, if: :signed_in?

    def current_user
        @current_user ||= User.find(session[:current_user_id])
    end

    def signed_in?
        session[:current_user_id].present?
    end
end
