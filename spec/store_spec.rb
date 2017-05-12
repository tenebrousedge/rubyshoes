require 'spec_helper'

RSpec.describe Rubyshoes::Store do
  it { should have_and_belong_to_many :brands }
end
