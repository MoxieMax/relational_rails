class AuthorsController < ApplicationController
  
  def index
    @authors = Author.all
  end
  
  def new
  end
  
  def create
    Author.create!(
      name: params[:name],
      alive: params[:alive],
      hometown: params[:hometown],
      age_published: params[:age_published]
    )
    redirect_to '/authors'
  end

  def edit
    @author = Author.find(params[:id])
  end
  
  def update
    @author = Author.find(params[:id])

    @author.update(
      name: params[:name],
      alive: params[:alive],
      hometown: params[:hometown],
      age_published: params[:age_published]
    )

    redirect_to "/authors/#{@author.id}"
  end
  
  def show
    @author = Author.find(params[:id])
  end
end