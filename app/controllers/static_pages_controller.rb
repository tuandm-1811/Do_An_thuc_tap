class StaticPagesController < ApplicationController
  def new 
    @product = Product.new
  end 
  def index
    @product = Product.all
  end
  def show
  end
end