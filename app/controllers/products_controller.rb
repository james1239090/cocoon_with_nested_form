class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:id,:name,
                                    product_options_attributes:[:id,:color_id, :dimension_id,:_destroy,
                                                                color_attributes:[:id,:name,:_destroy],
                                                                dimension_attributes:[:id,:name,:_destroy]])
  end
end
