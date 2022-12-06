require 'rails_helper'

RSpec.describe Author, type: :model do
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
  end
  
  describe 'relationships' do
    it {should have_many :books}
  end
  
  describe '#total_books' do
    it 'returns the total number of published books by the given author ID' do
      expect(@muir.total_books).to eq(4)
    end
  end
end