class StoresController < ApplicationController
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
    @store.save
    redirect_to stores_path
  end

  def edit
  end

  def update
    @store.update(store_params)
    redirect_to store_path(@store)
  end

  def destroy 
    @store.destroy
    redirect_to stores_path
  end


  private

  def store_params
    params.require(:store).permit(:name, :address, :category_ids => [])
  end

  def find_store
    @store = Store.find(params[:id])
  end
end
