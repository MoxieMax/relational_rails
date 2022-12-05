class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
end

# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)