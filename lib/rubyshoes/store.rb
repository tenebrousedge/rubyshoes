module Rubyshoes
  # ActiveRecord model for stores table
  class Store < ActiveRecord::Base
    has_and_belongs_to_many :brands
    validates :name, uniqueness: true, presence: true, length: { maximum: 100 }
    before_save(:capitalize_name)

    def capitalize_name
      name.capitalize unless name.nil?
    end
  end
end
