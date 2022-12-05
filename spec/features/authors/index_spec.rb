require 'rails_helper'

RSpec.describe 'Authors index' do
  
  it 'shows all authors' do
    muir = Author.create!(name: 'Tamsyn Muir', alive: true, hometown: 'Howick, New Zealand', age_published: 34)
    king = Author.create!(name: 'Stephen King', alive: true, hometown: 'Portland, Maine, USA', age_published: 26)
    chupeco = Author.create!(name: 'Rin Chupeco', alive: true, hometown: 'Manila, Philippines', age_published: 30)
    
    visit "/authors"
    
    expect(page).to have_content(muir.name)
    expect(page).to have_content(king.name)
    expect(page).to have_content(chupeco.name)
  end
end
