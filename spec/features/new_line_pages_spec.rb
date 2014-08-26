require 'rails_helper'

describe "creating a new line" do
  it "successfully creates a new line with a name" do
    Station.create(:name => ' the bar')
    visit '/lines/new'
    fill_in 'Name', :with => 'pickup'
    check('the bar')
    click_button 'Create Line'
    expect(page).to have_content 'pickup'
  end

  it "creates a new line when there are no stations or stops" do
    visit '/lines/new'
    fill_in 'Name', :with => 'pickup'
    click_button 'Create Line'
    expect(page).to have_content 'pickup'
  end

  it "flashes an error when the line's name is blank" do
    visit '/lines/new'
    fill_in 'Name', :with => ''
    click_button 'Create Line'
    expect(page).to have_content 'error'
  end
end
