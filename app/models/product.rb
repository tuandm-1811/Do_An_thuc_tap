class Product < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, :presence => true
    validates :content, :presence => true
    validates :price, :presence => true
end
