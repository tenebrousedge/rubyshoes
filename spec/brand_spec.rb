require 'spec_helper'

RSpec.describe Rubyshoes::Brand, type: :model do
  it { should have_and_belong_to_many :stores }
  it { is_expected.to callback(:capitalize_name).before :save }
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should validate_length_of(:name).is_at_most(100) }
end
