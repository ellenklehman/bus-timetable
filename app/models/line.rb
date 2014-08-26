class Line < ActiveRecord::Base
  has_many :stations, :through => :stops
  has_many :stops
  has_many :buses
  validates :name, :presence => true

def next_stop(current_station)
  all_stops = Stop.where(:line_id => self.id).order(:station_id)
  current_index = all_stops.index{ |stop| stop.station_id == current_station.id }
  if current_index == all_stops.length - 1
    current_station
  else
    all_stops[current_index + 1].station
  end
end


def line_map
  self.stations

end


end
