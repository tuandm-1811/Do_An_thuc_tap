class ProductsController < ApplicationController
before_action :fetch_product, only: [:show, :edit,:destroy]

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
  @comment = current_user.comments.build(product_id: params[:id]) if signed_in?
end

def create
  @product = Product.new(product_params)
  respond_to do |format|
    if @comment.save
        format.html { redirect_to @product, alert: 'Review was created successfully'}
        format.json {render :show, status: :created, location: @product}
    else
        format.html { redirect_to @product, alert: 'Review could not be saved'}
        format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end
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
