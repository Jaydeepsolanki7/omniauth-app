class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :user_signed_in?

  def current_user
    @current_user ||= Client.find(session[:client_id]) if session[:client_id].present?
  end

  def user_signed_in?
    !!current_user
  end
end
