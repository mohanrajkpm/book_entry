class BooksController < ApplicationController
	

	def index
		@books = Book.all

		# respond_to do |format|
  # 			format.html
  # 			format.js
		# end
	end

	def new
		@book = Book.new
	end

	def create
		@books = Book.new(book_params)
		if @books.save
			flash[:notice] = t('common.created_successfully', model_name: Book.name)
			redirect_to books_path
		end	
	end

	def edit
		@book = Book.find_by(id: params[:id])
	end

	def update
		@book.update_attributes(book_params)
		if @book
			flash[:notice] = t('common.updated_successfully', model_name: Book.name)
			redirect_to books_path
		end
	end

	private
		
		def book_params
			params.require(:book).permit(:name, :author, :isbn, :price, :category, :publish)
		end

end