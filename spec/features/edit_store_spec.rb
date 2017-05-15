require_relative 'feature_helper'

feature 'Edit Store Page' do
  before :each do
    @house = Faker::GameOfThrones.unique.house
    create_store(@house)
  end
  it 'allows the store name to be changed' do
    new_name = Faker::GameOfThrones.unique.house
    visit '/'
    first('.store').click @house
    fill_in 'store[name]', with: new_name
    click 'Edit Store'
    expect(page).to have_content new_name
  end

  it 'allows the store to be deleted' do
    visit '/stores'
    count = all('.stores').count
    first('.store').click @house
    click 'Delete Store'
    expect(page).to have_current_path('/stores')
    expect(all('.stores').count).to eq(count - 1)
  end
end
