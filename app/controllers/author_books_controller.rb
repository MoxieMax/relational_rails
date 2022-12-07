class AuthorBooksController < ApplicationController
  def index
    @author = Author.find(params[:id])
    @books = @author.books
  end
  
  def new
    @authors = Author.find(params[:id])
  end
  
  def create
    @author = Author.find(params[:id])

    Book.create!(
      title: params[:title],
      publish_date: params[:publish_date],
      pages: params[:pages],
      in_series: params[:in_series],
      author_id: @author.id
    )

    redirect_to "/authors/#{@author.id}/books"
  end
  
  def show
    @books = Book.find(params[:author_id])
  end
end