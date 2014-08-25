class Line < ActiveRecord::Base
  has_many :stations, :through => :stops
  has_many :stops
  validates :name, :presence => true
end
