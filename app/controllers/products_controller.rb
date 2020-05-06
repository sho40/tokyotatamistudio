class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: "DESC")
    @categories = Category.all
    @frames = Product.where(category_id: 3)
  end

  def show
    @product = Product.find(params[:id])
  end

end
