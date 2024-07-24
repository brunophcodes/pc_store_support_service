class UserMailer < ApplicationMailer
  def new_user_email
    @repair_request = params[:repair_request]

    mail(to: @repair_request.client_email, subject: "Notification about your repair request")
  end
end
