class ProductsController < ApplicationController
before_action :fetch_product, only: [:show, :edit,:destroy]
def index
  if user_signed_in?
    # @products = Product.all
    @products = Product.all.page(params[:page]).per(5)
  else
    flash[:alert] = 'you need login!'
    redirect_to new_user_session_path 
  end
end
def show
    @comments = @product.comments.all  
    
end
def create
  @product = Product.new(product_params)
end

def destroy
  @product.destroy
end

private
def fetch_product
  @product = Product.find(params[:id])
end

def product_params
  params.require(:product).permit(:title, :content,:price)
end

end
