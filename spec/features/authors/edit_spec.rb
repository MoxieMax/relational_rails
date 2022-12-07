require 'rails_helper'

RSpec.describe 'Author Update' do
  before do
    @muir = Author.create!(name: 'Tamsyn Muir', 
                            alive: true, 
                            hometown: 'Howick, New Zealand', 
                            age_published: 34)
  end
  
  it 'can create a new author' do
    visit "/authors/#{@muir.id}/edit"
      
    fill_in 'Name', with: 'Tamsyn Muir'
    check 'Alive'
    fill_in 'Hometown', with: 'Oxford, England, UK'
    fill_in 'age_published', with: 34
    
    click_button('Update Author')
    
    expect(current_path).to eq("/authors/#{@muir.id}")
  end
end
