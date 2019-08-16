class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?
  before_filter :authenticate

  def logged_in?
    session[:login]
  end

  private
  def authenticate
    login = authenticate_or_request_with_http_basic do |username, password|
      # TODO: move password to config variable when this is hosted somewhere
      username == "nri" && password == "lady-spin"
    end
    session[:login] = login
  end
end
