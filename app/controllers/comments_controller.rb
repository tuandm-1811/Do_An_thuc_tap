class CommentsController < ApplicationController
  def new 
    @comment = Comment.new

  end
  def index
    @comments = @product.comments.all
  end

  def show 
    @comment = Comment.where(params[:id])
  end
  def create 
    @user = current_user
    @product = Product.find_by_id(params[:product_id])
    @comment = Comment.new(comment_params)

    respond_to do |format|
      byebug
      if @comment.save
        format.html { redirect_to @comment.post, notice: 'Comment được tạo thành công' }
        format.js   { }
        format.json { render :show }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def comment_params
      params.require(:comment).permit(:user_id,:product_id,:comment_content)
      
  end
    
end
