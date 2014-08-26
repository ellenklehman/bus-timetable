require 'rails_helper'

describe Bus do
  it { should belong_to :line }
  it { should have_many :stops }
  it { should have_many :stations }
  it { should validate_numericality_of :number}
end
