require 'rails_helper'

describe Line do
  it { should have_and_belong_to_many :stations }
  it { should validate_presence_of :name }

  describe "next_stop" do
    it "will return the next stop after the current stop" do
      new_station = Station.create(:name => "Paddington 1")
      another_station = Station.create(:name => "Hugo 2")
      yet_another_station = Station.create(:name => "Kings Cross 3")
      new_line = Line.create(:name => "Hogwarts Express")
      new_stop = new_line.stops.create(:station_id => new_station.id)
      another_stop = new_line.stops.create(:station_id => another_station.id)
      yet_another_stop = new_line.stops.create(:station_id => yet_another_station.id)
      current_stop = Stop.find_by(:station_id => another_station.id, :line_id => new_line.id)
      next_stop = Stop.find_by(:station_id => yet_another_station.id, :line_id => new_line.id)

      expect(new_line.next_stop(another_station)).to eq yet_another_station
    end
  end


  describe "line_map" do
    it "will a hash of arrays of hashes of nodes and edges" do
      new_station = Station.create(:name => "Paddington 1")
      another_station = Station.create(:name => "Hugo 2")
      yet_another_station = Station.create(:name => "Kings Cross 3")
      new_line = Line.create(:name => "Hogwarts Express")
      new_stop = new_line.stops.create(:station_id => new_station.id)
      another_stop = new_line.stops.create(:station_id => another_station.id)
      yet_another_stop = new_line.stops.create(:station_id => yet_another_station.id)
      result = {nodes: [{id: 1, caption: new_station.name}, {id: 2, caption: another_station.name}, {id: 3, caption: yet_another_station.name}], edges: [{source: 1, target: 2, caption: new_line.name}, {source: 2, target: 3, caption: new_line.name}]}
      expect(new_line.line_map).to eq result
    end
  end

  describe "big_map" do
    it "returns all lines and stations in format to be mapped" do
      new_station = Station.create(:name => "Paddington 1")
      another_station = Station.create(:name => "Hugo 2")
      yet_another_station = Station.create(:name => "Kings Cross 3")
      station_max = Station.create(:name => "Union")
      new_line = Line.create(:name => "Hogwarts Express")
      another_line = Line.create(:name => "Max")
      new_stop = new_line.stops.create(:station_id => new_station.id)
      another_stop = new_line.stops.create(:station_id => another_station.id)
      yet_another_stop = new_line.stops.create(:station_id => yet_another_station.id)
      stop_max = another_line.stops.create(:station_id => station_max.id)
      stop_max_2 = another_line.stops.create(:station_id => new_station.id)
      stop_max_3 = another_line.stops.create(:station_id => yet_another_station.id)
      result = {nodes: [{id: 1, caption: new_station.name}, {id: 2, caption: another_station.name}, {id: 3, caption: yet_another_station.name}, {id: 4, caption: station_max.name}], edges: [{source: 1, target: 2, caption: new_line.name}, {source: 2, target: 3, caption: new_line.name}, {source: 1, target: 3, caption: another_line.name}, {source: 3, target: 4, caption: another_line.name}]}
      expect(Line.big_map).to eq result
    end
  end
end

