class ApplicationController < ActionController::Base
    before_action :fetch_user

    private
    def fetch_user
        @current_user = User.find_by :id => session[:user_id] # WILL NOT THROW AN ERROR
        # @current_user = User.find_by session[:user_id]  # WILL THROW AN ERROR
        session[:user_id] = nil unless @current_user.present? # LOG OUT non-existent users.
    end

    def check_for_login
        redirect_to login_path unless @current_user.present?
    end

    def check_for_admin
        redirect_to login_path unless (@current_user.present? && @current_user.admin?)
    end
end
