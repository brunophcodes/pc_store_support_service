class RepairRequestsController < ApplicationController
  before_action :find_repair_request, only: %i[show edit update destroy]
 
  def index 
    @repair_requests = RepairRequest.all
  end

  def show
  end

  def new
    @repair_request = RepairRequest.new
    @categories = Category.all.map {|cat| cat.name } 
  end

  def create 
     @repair_request = RepairRequest.new(repair_request_params)
     @repair_request.repair_status = 'Pending'

     #Getting the available stores that matches the product category
     @available_stores = Store.joins(:categories).where(categories: {name: @repair_request.product_category})
     @repair_request.store_id = @available_stores.sort.first.id
     @repair_request.save
  end

  def edit
  end

  def update
     @repair_request = RepairRequest.update(repair_request_params)
     redirect_to repair_request_path(@repair_request)
  end

  def destroy
    @repair_request.destroy
    redirect_to repair_request_path
  end

  private

  def repair_request_params
    params.require(:repair_request).permit(:client_email, :product_category, :product_name, :repair_description)
  end

  def find_repair_request
    @repair_request = RepairRequest.find(param[:id])
  end
end
