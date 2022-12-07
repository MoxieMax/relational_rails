require 'rails_helper'

RSpec.describe 'Author creation' do
  it 'links to the new page from the authors index' do
    visit '/authors'

    click_link('New Author')
    expect(current_path).to eq('/authors/new')
  end

  it 'can create a new author' do
    visit '/authors/new'
    
    fill_in 'Name', with: 'Richelle Mead'
    check 'Alive'
    fill_in 'Hometown', with: 'Kirkland, WA'
    fill_in 'age_published', with: 31
    
    click_button('Create Author')
    
    expect(current_path).to eq('/authors')
    expect(page).to have_content('Richelle Mead')
  end
end
