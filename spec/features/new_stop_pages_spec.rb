require 'rails_helper'

describe "creating a new stop" do
  it "successfully creates a new stop with a station and line" do
    Station.create(:name => 'the bar')
    Line.create(:name => 'pickup')
    visit '/stops/new'
    select('the bar')
    select('pickup')
    click_button 'Create Stop'
    expect(page).to have_content 'pickup'
  end
end
