class ProductsController < ApplicationController

def new 
  @product = Product.new
end

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
  @product = Product.find_by(params[:id])
  @comments = @product.comments.order("created_at DESC")
end

end
