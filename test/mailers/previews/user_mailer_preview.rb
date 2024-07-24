# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def new_user_email
    repair_request = RepairRequest.new(client_email: 'bruno@gmail.com', product_name: 'Sony Bravia Q499', product_category: 'TV', repair_description: "Doesn't turn on", repair_price: 100, repair_status: 'Aproved', store_id: '1')

    UserMailer.with(repair_request: repair_request).new_user_email
  end
end