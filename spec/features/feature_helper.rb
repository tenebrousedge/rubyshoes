require_relative '../spec_helper'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'faker'

Capybara.app = RubyshoesApp

module RubyshoesHelper
  def create_store(name)
    visit '/stores/new'
    fill_in 'store[name]', with: name
    click 'Create Store'
  end

  def create_brand(name, price)
    visit '/brands/new'
    fill_in 'brand[name]', with: name
    fill_in 'brand[price]', with: price
    click 'Create Brand'
  end
end

RSpec.configure do |c|
  c.include Capybara
  c.include RubyshoesHelper, type: :feature
end
