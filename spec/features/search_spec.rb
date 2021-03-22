require 'rails_helper'
describe 'post code search process', type: :feature do

 it 'Search for the valid post code' do
   visit '/search'
   fill_in 'search', with: 'SE17QD'
   click_button 'Search'
  expect(page).to have_text('Service available for SE17QD')
 end

 it 'Search for the valid post code but unknown post code for API' do
    visit '/search'
    fill_in 'search', with: 'SH24 1AA'
    click_button 'Search'
   expect(page).to have_text('Service Availale for SH241AA')
  end

  it 'Search for the invalid' do
    visit '/search'
    fill_in 'search', with: 'SE17QDA'
    click_button 'Search'
   expect(page).to have_text('Invalid post code SE17QDA')
  end
end