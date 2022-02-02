class UsersController < ApplicationController
  before_action :authenticate_user!
  
  before_action :resource,:resource_name,:devise_mapping 
  
  protected
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
