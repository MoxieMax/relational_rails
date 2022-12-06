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
      
      fill_in 'title', with: 'Princess Floralinda and the Forty-Flight Tower'
      fill_in 'publish_date', with: '2020-11-30'
      fill_in 'pages', with: 146
      
      click_button('Create Book')
      
      expect(current_path).to eq("/authors/#{@muir.id}/books")
      expect(page).to have_content(@flora.title)
      expect(page).to have_content(@flora.publish_date)
      expect(page).to have_content(@flora.length)
      expect(@flora.in_series).to eq(false)
    end
  end

  # it 'can create a new author' do
  #   visit '/authors/new'
  # 
  #   fill_in 'Name', with: 'Richelle Mead'
  #   check 'Alive'
  #   fill_in 'Hometown', with: 'Kirkland, WA'
  #   fill_in 'age_published', with: 31
  # 
  #   click_button('Create Author')
  # 
  #   expect(current_path).to eq('/authors')
  #   expect(page).to have_content('Richelle Mead')
  # end
end
