class BooksController < ApplicationController
	
	before_action :find_book, only: [:edit, :update, :destroy]

	#Render index page
	#
	#Displaying all books
	def index
		coditions = ''
		if params[:query].present?
			qry = params[:query].downcase 	
			coditions = ["lower(name) LIKE ? OR lower(author) LIKE ? OR lower(isbn) LIKE ?", "%#{qry}%", "%#{qry}%", "%#{qry}%"]
		end
		
		default_sort = params[:sort].present? ? params[:sort] : 'name'
		default_order = params[:direction].present? ? params[:direction] : 'asc' 
		@books = Book.where(coditions).order(default_sort + ' ' + default_order)
		respond_to do |format|
      		format.html # show.html.erb
      		format.js { 
      			render 'list'
      		 }
    	end
	end

	#Render new page
	#
	#Displaying new book page
	def new
		@book = Book.new
	end

	#Create a book.
	#
	#Create a book.
	def create
		@books = Book.new(book_params)
		if @books.save
			flash[:notice] = t('common.created_successfully', model_name: Book.name)
			redirect_to books_path
		end	
	end

	def edit
		#Rendering edit page.
	end

	#Update a book.
	#
	#Update a book.
	def update
		@book.update_attributes(book_params)
		if @book
			flash[:notice] = t('common.updated_successfully', model_name: Book.name)
			redirect_to books_path
		end
	end

	#Render destroy method
	#
	#Destroy the book
	def destroy
		if @book.destroy
			flash[:notice] = t('common.deleted_successfully', model_name: Book.name)
			redirect_to books_path
		end
	end

	private
		
		def find_book
			@book = Book.find_by(id: params[:id])
		end

		def book_params
			params.require(:book).permit(:name, :author, :isbn, :price, :category, :publish)
		end

end