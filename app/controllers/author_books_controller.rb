class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:id])
    @books = @author.books
  end
  
  def show
    @books = Book.find(params[:author_id])
  end
end