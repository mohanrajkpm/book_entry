require 'rails_helper'

RSpec.describe Book, :type => :model do
  
  context "Access the books validations" do
      @book = FactoryGirl.create(:book)
      
	  it "book name check presence" do
	    @book.name = nil
	    expect(@book).to not_be_valid
	  end

	  it "book author check presence" do
	    @book.author = nil
	    expect(@book).to not_be_valid
	  end

	  it "book isbn check presence" do
	    @book.isbn = nil
	    expect(@book).to not_be_valid
	  end

	  it "book price check presence" do
	    @book.price = nil
	    expect(@book).to not_be_valid
	  end

	  it "book category check presence" do
	    @book.category = nil
	    expect(@book).to not_be_valid
	  end

	  it "book name check uniqueness" do
	    @book.name = 'c'
	    expect(@book).to not_be_valid
	  end

	  it "book isbn check uniqueness" do
	    @book.isbn = 'c-1'
	    expect(@book).to not_be_valid
	  end
	end
end