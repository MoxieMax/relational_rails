class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])

    @book.update(
      title: params[:title],
      publish_date: params[:publish_date],
      pages: params[:pages],
      in_series: params[:in_series]
    )

    redirect_to "/books/#{@book.id}"
  end
end