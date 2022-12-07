require 'rails_helper'

RSpec.describe 'Authors books index' do
  
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
    @flora = @muir.books.create!(title: 'Princess Floralinda and the Forty-Flight Tower', 
                                publish_date: '2020-11-30', 
                                pages: 146, 
                                in_series: false)
  end
  
  describe 'index exists' do
    it 'shows all of the titles of the books for the author' do
      
      visit "/authors/#{@muir.id}/books"
      
      expect(page).to have_content(@gideon.title)
      expect(page).to have_content(@harrow.title)
      expect(page).to have_content(@nona.title)
      expect(page).to have_content(@flora.title)
      
      expect(page).to have_content(@gideon.publish_date)
      expect(page).to have_content(@harrow.publish_date)
      expect(page).to have_content(@nona.publish_date)
      expect(page).to have_content(@flora.publish_date)
      
      expect(page).to have_content(@gideon.pages)
      expect(page).to have_content(@harrow.pages)
      expect(page).to have_content(@nona.pages)
      expect(page).to have_content(@flora.pages)
      
      expect(page).to have_content(@gideon.in_series)
      expect(page).to have_content(@harrow.in_series)
      expect(page).to have_content(@nona.in_series)
      expect(page).to have_content(@flora.in_series)
    end
  end
  
  describe 'includes the option to add more books' do
    it 'has a button to create new books' do
      visit "/authors/#{@muir.id}/books"
      click_on 'Create Book'
      
      expect(page).to have_current_path("/authors/#{@muir.id}/books/new")
    end
  end
  
end
