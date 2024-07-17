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
        @category.save
        redirect_to categories_path
    end

    def edit
    end

    def update
        @category.update(category_params)
        redirect_to category_path(@category)
    end

    def destroy
        @category.destroy
        redirect_to categories_path
    end
    

    private
    
    def category_params
        params.require(:category).permit(:name)
    end

    def find_category
        @category = Category.find(params[:id])
    end

end
