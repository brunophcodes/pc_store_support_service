class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    #return the path based on resource
    repair_requests_path
  end
end
