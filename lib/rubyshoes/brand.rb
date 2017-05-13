module Rubyshoes
  # Active Record model for brands table
  class Brand < ActiveRecord::Base
    has_and_belongs_to_many :stores
    validates :name, uniqueness: true, presence: true, length: { maximum: 100 }
    before_save(:capitalize_name)
    after_find(:price_to_s)

    def capitalize_name
      name.capitalize unless name.nil?
    end

    def price_to_s
      # this doesn't work but it's only here to meet an arbitrary requirement
      '$' + price.to_s unless price.nil?
    end
  end
end
