class CategoriesController < ApplicationController
    before_action :find_category, only: %i[show edit update destroy]

    def index 
        @categories = Category.all
    end

    def show
    end

    def new
        @category = Category.new
    end

    def create 
        @category = Category.new(category_params)
    end

    def edit
    end

    def update
        @category = Category.update(category_params)
    end

    def destroy
        @category.destroy
    end
    

    private
    
    def category_params
        params.require(:category).permit(:name)
    end

    def find_category
        @category = Category.find(params[:id])
    end

end
