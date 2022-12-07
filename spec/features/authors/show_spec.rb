require 'rails_helper'

RSpec.describe 'Authors show' do
  before do
    @muir = Author.create!(name: 'Tamsyn Muir', 
                            alive: true, 
                            hometown: 'Howick, New Zealand', 
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
    
    visit "/authors/#{@muir.id}"
  end
  
  it 'shows all authors' do
    expect(page).to have_content(@muir.name)
    expect(page).to have_content(@muir.alive)
    expect(page).to have_content(@muir.hometown)
    expect(page).to have_content(@muir.age_published)
  end
  
  it 'displays the authors book count' do
    expect(page).to have_content("Total Books: #{@muir.total_books}")
  end
  
  it 'has a link to their books' do
    click_on "#{@muir.name}'s Books"
    
    expect(page).to have_current_path("/authors/#{@muir.id}/books")
  end
  
  it 'has a link to update author information' do
    click_on 'Update Author'
    
    expect(page).to have_current_path("/authors/#{@muir.id}/edit")
  end
end