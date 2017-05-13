require_relative 'feature_helper'

feature 'Add Store Page' do
  it 'allows the user to create a store' do
    name = Faker::GameOfThrones.house
    visit '/stores/new'
    fill_in 'stores[name]', with: name
    click 'Create Store'
    expect(page).to have_content name
  end
end
