require 'rails_helper'

RSpec.describe 'Books show' do
  
  it 'shows a specified book' do
    muir = Author.create!(name: 'Tamsyn Muir', alive: true, hometown: 'Howick, New Zealand', age_published: 34)
    
    book = muir.books.create!(title: 'Gideon the Ninth', publish_date: '2019-09-10', pages: 448, in_series: true)
    
    visit "/books/#{book.id}"
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.pages)
    expect(page).to have_content(book.publish_date)
  end
end