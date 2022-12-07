Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  get '/authors/:id', to: 'authors#show'
  get '/authors/:id/edit', to: 'authors#edit'
  get '/books/:id/edit', to: 'books#edit'
  
  patch 'authors/:id', to: 'authors#update'
  
  get '/authors/:id/books', to: 'author_books#index'
  
  get '/authors/:id/books/new', to: 'author_books#new'
  post '/authors/:id/books', to: 'author_books#create'
  
  post 'authors', to: 'authors#create'
  
  get '/authors/:id}/books/new', to: 'author_books#create'
end
