class RepairRequest < ApplicationRecord
  belongs_to :store
  validates :client_email, :product_category, :product_name, :repair_description, presence: true
  after_create :asign_store
  after_update_commit :email_client

  private

  def asign_store
    AsignStoreJob.set(wait: 2.hours).perform_later(id)
  end

  def email_client
    UserMailer.with(repair_request: self).new_user_email.deliver_later
  end
end
