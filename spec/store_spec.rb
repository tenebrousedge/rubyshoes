require 'spec_helper'

RSpec.describe Rubyshoes::Store, type: :model do
  it { should have_and_belong_to_many :brands }
  it { is_expected.to callback(:capitalize_name).before :save }
end
