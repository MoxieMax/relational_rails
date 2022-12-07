require 'rails_helper'

RSpec.describe 'Author creation' do
  before do
    @muir = Author.create!(name: 'Tamsyn Muir', 
                          alive: true, 
                          hometown: 'Howick, NZ', 
                          age_published: 34)
    @gideon = @muir.books.create!(title: 'Gideon the Ninth', 
                                  publish_date: '2019-09-10', 
                                  pages: 448, 
                                  in_series: true)
    @harrow = @muir.books.create!(title: 'Harrow the Ninth', 
                                  publish_date: '2020-08-04', 
                                  pages: 552, 
                                  in_series: true)
    @nona = @muir.books.create!(title: 'Nona the Ninth', 
                                publish_date: '2022-09-13', 
                                pages: 480, 
                                in_series: true)
  end
  
  describe 'can create a new book' do
    it 'links to the new page from the authors book index' do
      visit "/authors/#{@muir.id}/books"

      click_link('Create Book')
      expect(current_path).to eq("/authors/#{@muir.id}/books/new")
    end
    
    it 'has a fillable form to create a new book' do
      visit "/authors/#{@muir.id}/books/new"
      
      fill_in 'title', with: 'Alecto the Ninth'
      fill_in 'publish_date', with: '2023-11-30'
      fill_in 'pages', with: 500
      check 'in_series'
      
      click_button('Create Book')
      
      expect(current_path).to eq("/authors/#{@muir.id}/books")
      expect(page).to have_content('Alecto the Ninth')
      expect(page).to have_content('2023-11-30')
      expect(page).to have_content(500)
    end
  end
end
