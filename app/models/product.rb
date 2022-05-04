class Product < ApplicationRecord
    has_many :comments
    validates :title, :presence => true
    validates :content, :presence => true
    validates :price, :presence => true
    
    accepts_nested_attributes_for :comments, allow_destroy: true,
    reject_if: :all_blank
end
