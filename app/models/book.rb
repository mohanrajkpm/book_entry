
class Book < ApplicationRecord
	validates :name, :author, :isbn, :price, :category, presence: true
	validates :name, :isbn, uniqueness: true
end
