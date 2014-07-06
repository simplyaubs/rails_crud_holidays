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

  scenario 'User can update a holiday from list' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a holiday'
    fill_in 'Name', with: '4th of July'
    fill_in 'Celebrate', with: 'Freedom'
    click_on 'Add holiday'
    expect(page).to have_content '4th of July'
    expect(page).to have_content 'Freedom'
    click_on '4th of July'
    expect(page).to have_content '4th of July'
    expect(page).to have_content 'Freedom'
    click_on 'Edit'
    fill_in 'Name', with: 'Thanksgiving'
    fill_in 'Celebrate', with: 'Gratitude'
    click_on 'Update holiday'
    expect(page).to have_content 'Thanksgiving'
    expect(page).to have_content 'Gratitude'
    expect(page).to_not have_content '4th of July'
    expect(page).to_not have_content 'Freedom'
  end

  scenario 'User can delete a holiday from list' do
    visit '/'
    expect(page).to have_content 'Welcome'
    click_on 'Add a holiday'
    fill_in 'Name', with: '4th of July'
    fill_in 'Celebrate', with: 'Freedom'
    click_on 'Add holiday'
    expect(page).to have_content '4th of July'
    expect(page).to have_content 'Freedom'
    click_on '4th of July'
    expect(page).to have_content '4th of July'
    expect(page).to have_content 'Freedom'
    click_on 'Delete'
    expect(page).to_not have_content '4th of July'
    expect(page).to_not have_content 'Freedom'
  end
end