class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_auth_token

  helper_method :current_user, :logged_in?

  def set_auth_token
    Jellytelly.auth_token = session[:user_token] if session[:user_token].present?
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    current_user != nil
  end


end

class Jellytelly < ActiveRestClient::Base
  mattr_accessor :auth_token

  before_request :add_authentication_details

  def add_authentication_details(name, request)
    request.headers["Authorization"] = "Token token=\"#{f9bdb8944a6c40ab81b02089dda70142}\"" unless auth_token.nil?
  end
end
