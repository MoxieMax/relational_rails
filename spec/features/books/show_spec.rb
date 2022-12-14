require 'rails_helper'

RSpec.describe 'Books show' do
  before do
    @muir = Author.create!(name: 'Tamsyn Muir', 
                          alive: true, 
                          hometown: 'Howick, NZ', 
                          age_published: 34)
    @gideon = @muir.books.create!(title: 'Gideon the Ninth', 
                                  publish_date: '2019-09-10', 
                                  pages: 448, 
                                  in_series: true)
    visit "/books/#{@gideon.id}"
  end
  it 'shows a specified book' do
    visit "/books/#{@gideon.id}"
    expect(page).to have_content(@gideon.title)
    expect(page).to have_content(@gideon.pages)
    expect(page).to have_content(@gideon.publish_date)
  end
  
  it 'has the option to update the book information' do
    click_on 'Update Book'
    
    expect(page).to have_current_path("/books/#{@gideon.id}/edit")
  end
end