class Station < ActiveRecord::Base
  has_many :lines, :through => :stops
  has_many :stops
  validates :name, :presence => true
end
