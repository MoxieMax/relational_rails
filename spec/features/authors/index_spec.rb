require 'rails_helper'

RSpec.describe 'Authors index' do
  before do
    @muir = Author.create!(name: 'Tamsyn Muir', alive: true, hometown: 'Howick, New Zealand', age_published: 34)
    @king = Author.create!(name: 'Stephen King', alive: true, hometown: 'Portland, Maine, USA', age_published: 26)
    @chupeco = Author.create!(name: 'Rin Chupeco', alive: true, hometown: 'Manila, Philippines', age_published: 30)
    
    visit "/authors"
  end
  
  it 'shows all authors' do
    expect(page).to have_content(@muir.name)
    expect(page).to have_content(@king.name)
    expect(page).to have_content(@chupeco.name)
  end
  
  it 'shows created_at' do
    expect(page).to have_content(@muir.created_at)
    expect(page).to have_content(@king.created_at)
    expect(page).to have_content(@chupeco.created_at)
  end
  
  xit 'new author button exists and is clickable' do
    visit '/authors/new'

    click_button('New Author')

    expect(current_path).to eq('/authors/new')
  end
end
