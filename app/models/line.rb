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
    nodes = []
    all_stations = Stop.where(:line_id => self.id).order(:station_id).map { |stop| stop.station }
    all_stations.each_with_index do |station, index|
      nodes << {id: index + 1, caption: station.name }
    end
    edges = []
    (1..all_stations.length - 1).each do |number|
      edges << {source: number, target: number + 1}
    end
    {nodes: nodes, edges: edges}
  end
end

