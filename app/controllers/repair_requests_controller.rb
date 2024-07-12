class RepairRequestsController < ApplicationController

  def index 
    @repair_requests = RepairRequest.all
  end

  def show
  end

  def new
    @repair_request = RepairRequest.new
  end

  def create 
     @repair_request = RepairRequest.new(repair_request_params)
  end

  def edit
  end

  def update
     @repair_request = RepairRequest.update(repair_request_params)
  end

  def destroy
    @repair_request.destroy
  end

  private

  def repair_request_params
    params.require(:repair_request).permit(:client_email, :product_category, :product_name, :repair_description)
  end

  def find_repair_request
    @repair_request = RepairRequest.find(param[:id])
  end
end
