# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
#  skip_before_action :set_current_user, only: [:new, :create]
#  skip_before_action :require_no_authentication, :only => [:new, :create]


def sign_as_demo
  @demo_user ||= User.find_by_email('demo@example.com')
  if current_user.nil?
    sign_in(@demo_user)
    redirect_to repair_requests_path
  end
end
  # GET /resource/sign_in
  # def new
  #  super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
