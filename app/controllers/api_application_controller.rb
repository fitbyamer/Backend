class ApiApplicationController < ApplicationController

  skip_before_action :verify_authenticity_token, :authenticate_user!
  before_action :validate_user!
  respond_to :json

  def validate_user!
    authenticate_or_request_with_http_token do |token, options|
      params[:access_token] = token
      exists = ApiToken.exists?(token: token)
      if exists
        @current_user ||= ApiToken.includes(:user).find_by(token: token).user
        true
      else
        false
      end
    end
  end

  protected

  def current_user
    @current_user
  end
end
