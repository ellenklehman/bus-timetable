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
end
