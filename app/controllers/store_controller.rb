class StoreController < ApplicationController
  before_action :find_store, only: %i[edit show update destroy]

  def index 
    @stores = Store.all
  end

  def show
  end

  def new
    @store = Store.new
  end
 
  def create 
    @store = Store.new(store_params)
  end

  def edit
  end

  def update
    @store = Store.update(store_params)
  end

  def destroy 
    @store = Store.destroy
  end


  private

  def store_params
    params.require(:store).permit(:name, :address)
  end

  def find_store
    @store = Store.find(params[:id])
  end
end
