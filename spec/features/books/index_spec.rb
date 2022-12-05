require 'rails_helper'

RSpec.describe 'Artists songs index' do
  
  it 'shows all of the titles of the songs for the artist' do
    muir = Author.create!(name: 'Tamsyn Muir', alive: true, hometown: 'Howick, New Zealand', age_published: 34)
    gideon = muir.books.create!(title: 'Gideon the Ninth', publish_date: '2019-09-10', pages: 448, in_series: true)
    harrow = muir.books.create!(title: 'Harrow the Ninth', publish_date: '2020-08-04', pages: 552, in_series: true)
    nona = muir.books.create!(title: 'Nona the Ninth', publish_date: '2022-09-13', pages: 480, in_series: true)
    flora = muir.books.create!(title: 'Princess Floralinda and the Forty-Flight Tower', publish_date: '2020-11-30', pages: 146, in_series: false)
    
    visit "/books"
    
    expect(page).to have_content(gideon.title)
    expect(page).to have_content(gideon.pages)
    expect(page).to have_content(gideon.publish_date)
  end
end