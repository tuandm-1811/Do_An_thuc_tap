class Admin::ProductsController  < Admin::BaseController
before_action :fetch_product, only: [:show, :edit,:destroy,:update]
def new
  @product = Product.new
end
def index
  if user_signed_in?
    # @products = Product.all
    @products = Product.order(created_at: :desc).page(params[:page]).per(5)
    
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
  if @product.save 
    flash[:flash] = 'product created success'
    redirect_to admin_products_path
  else
    flash[:flash] = 'product created failed'
    redirect_to new_admin_product_path
  end
end
def edit
end
def update
  if @product.update(product_params)
    flash[:success] = "product was successfully updated."
    redirect_to admin_products_path
    else
      flash[:danger] = "Product was not successfully updated."
      redirect_to admin_product_path(@product)
  end
end

def destroy
  if @product.destroy 
    flash[:flash] = 'product delete success'
    redirect_to admin_products_path
  else
    flash[:flash] = 'product delete success fail'
    redirect_to admin_products_path
  end

end

private
def fetch_product
  @product = Product.find(params[:id])
  
end

def product_params
  params.require(:product).permit(:title, :content,:price)
end

end
