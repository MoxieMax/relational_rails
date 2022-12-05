require 'rails_helper'

RSpec.describe 'Authors show' do
  
  it 'shows all authors' do
    author = Author.create!(name: 'Tamsyn Muir', alive: true, hometown: 'Howick, New Zealand', age_published: 34)
    
    visit "/authors/#{author.id}"
    expect(page).to have_content(author.name)
    expect(page).to have_content(author.alive)
    expect(page).to have_content(author.hometown)
    expect(page).to have_content(author.age_published)
  end
end