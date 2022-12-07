require 'rails_helper'

RSpec.describe 'Author Update' do
  before do
    @muir = Author.create!(name: 'Tamsyn Muir', 
                          alive: true, 
                          hometown: 'Howick, NZ', 
                          age_published: 34)
    @gideon = @muir.books.create!(title: 'Gideon the Ninth', 
                                  publish_date: '2019-09-10', 
                                  pages: 448, 
                                  in_series: true)
  end
  visit 
  
  it 'can create a new author' do
    visit "/books/#{@gideon.id}/edit"
      
    fill_in 'Title', with: 'Gideon the Ninth'
    fill_in 'publish_date', with: '2019-09-10'
    fill_in 'pages', with: 450
    check 'in_series'
    
    click_button('Update Book')
    
    expect(current_path).to eq("/books/#{@gideon.id}")
  end
end
