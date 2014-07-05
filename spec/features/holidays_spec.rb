require 'spec_helper'

feature 'CRUD holidays' do
  scenario 'User can create a list of holidays' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a holiday'
    fill_in 'Name', with: '4th of July'
    fill_in 'Celebrate', with: 'Freedom'
    click_on 'Add holiday'
    expect(page).to have_content '4th of July'
    expect(page).to have_content 'Freedom'
  end
end