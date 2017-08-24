class Api::V1::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_action :cors_set_access_control_headers
  # after_action :cors_set_access_control_headers
  #
  # def cors_set_access_control_headers
  #   headers['Access-Control-Request-Method'] = '*'
  #   headers['Access-Control-Allow-Headers'] = '*'
  #   headers["Access-Control-Allow-Methods"] = "GET, PUT, POST, DELETE, OPTIONS"
  # end
end
