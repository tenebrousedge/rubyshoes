require 'spec_helper'

Rspec.describe Rubyshoes::Brand do
  it { should have_and_belong_to_many :stores }
end
