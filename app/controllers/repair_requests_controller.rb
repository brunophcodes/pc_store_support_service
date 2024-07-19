class RepairRequestsController < ApplicationController
  before_action :find_repair_request, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[new create]
 
  def index 
    @repair_requests = RepairRequest.all.sort
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
     if @available_stores.size == 0
       redirect_to pages_sorry_path
     else
       @repair_request.store_id = @available_stores.sort.first.id
       @repair_request.save
       redirect_to pages_farewell_path
     end
  end

  def edit
  end

  def update
     @repair_request.update(repair_request_params)
     redirect_to repair_request_path(@repair_request)
  end

  def destroy
    @repair_request.destroy
    redirect_to repair_request_path
  end

  private

  def repair_request_params
    params.require(:repair_request).permit(:client_email, :product_category, :product_name, :repair_description, :repair_price, :repair_status, :store_id)
  end

  def find_repair_request
    @repair_request = RepairRequest.find(params[:id])
  end
end
