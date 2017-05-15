require_relative 'feature_helper'

Capybara.app = RubyshoesApp::BrandController

feature 'Add Brand Page' do
  it 'allows the user to create a brand' do
    name = Faker::GameOfThrones.house
    price = Faker::Commerce.price
    visit '/new'
    fill_in '#name', with: name, name: 'brand[name]'
    fill_in 'input', with: price, name: 'brand[price]'
    click 'Create Brand'
    expect(page).to have_content name
    expect(page).to have_content price
  end
end
