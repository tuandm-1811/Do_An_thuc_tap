class CommentsController < ApplicationController
    def index
       @comments = Comment.all
    end
    def create 
      @user = current_user 
      @product = Product.find(params[:id])
      @comment = current_user.comment.new(comment_params)
      if @comment.save
        flash[:success] = 'Commented success!'
        redirect_to product_path(product)
      else
        flash[:danger] = 'Please ,try again!'
        redirect_to product_path(product)
      end
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id,:product_id,:content)
        
    end
    
end
