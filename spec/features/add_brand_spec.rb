require_relative 'feature_helper'

feature 'Add Brand Page' do
  it 'allows the user to create a brand' do
    name = Faker::GameOfThrones.house
    price = Faker::Commerce.price
    visit '/brands/new'
    fill_in 'brand[name]', with: name
    fill_in 'brand[price]', with: price
    click 'Create Brand'
    expect(page).to have_content name
    expect(page).to have_content price
  end
end
