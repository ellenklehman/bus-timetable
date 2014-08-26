class Line < ActiveRecord::Base
  has_many :stations, :through => :stops
  has_many :stops
  has_many :buses
  validates :name, :presence => true

end
