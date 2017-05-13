require_relative 'feature_helper'

feature 'Edit Brand Page' do
  before :each do
    @dragon = Faker::GameOfThrones.unique.dragon
    @price = Faker::Commerce.price
    create_brand(@dragon)
  end
  it 'allows the brand name to be changed' do
    new_name = Faker::GameOfThrones.unique.dragon
    price = Faker::Commerce.price
    visit '/brands'
    first('.brand').click @dragon
    fill_in 'brand[name]', with: new_name
    fill_in 'brand[price]', with: price
    click 'Edit Brand'
    expect(page).to have_content new_name
    expect(page).to have_content price
  end

  it 'allows the brand to be deleted' do
    visit '/brands'
    count = all('.brands').count
    first('.brand').click @dragon
    click 'Delete Brand'
    expect(page).to have_current_path('/brands')
    expect(all('.brands').count).to eq(count - 1)
  end
end
