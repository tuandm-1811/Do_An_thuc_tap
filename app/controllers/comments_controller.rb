class CommentsController < ApplicationController
  def new 
    @comment = Comment.new

  end
  # def index
  #   @comments = @product.comments.all
  # end
  def create 
    @user = current_user 
    @comment = current_user.comments.build comment_params
    @product = Product.find_by_id(params[:product_id])
    if @comment.save
      flash[:success] = 'Commented success!'
      redirect_to product_path(@product)
    else
      flash[:danger] = 'Please ,try again!'
      redirect_to new_product_comments_path
    end
  end

  private
  def comment_params
      params.require(:comment).permit(:user_id,:product_id,:comment_content)
      
  end
    
end
