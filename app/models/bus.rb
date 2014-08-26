class Bus < ActiveRecord::Base
  belongs_to :line
  has_many :stops, :through => :line
  has_many :stations, :through => :stops
  validates :number, :numericality => true
end
