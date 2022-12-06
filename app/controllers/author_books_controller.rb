class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:id])
    @books = @author.books
  end
  
  def new
    @authors = Author.find(params[:id])
  end
  
  def show
    @books = Book.find(params[:author_id])
  end
end