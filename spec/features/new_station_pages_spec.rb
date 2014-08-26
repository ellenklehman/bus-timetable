require 'rails_helper'

describe "creating a new station" do
  it "successfully creates a new station with a name" do
    Line.create(:name => 'green')
    visit '/stations/new'
    fill_in 'Name', :with => 'north pole'
    check('green')
    click_button 'Create Station'
    expect(page).to have_content 'north pole'
  end

  it "creates a new station when there are no lines or stops" do
    visit '/stations/new'
    fill_in 'Name', :with => 'north pole'
    click_button 'Create Station'
    expect(page).to have_content 'north pole'
  end

  it "flashes an error when the station's name is blank" do
    visit '/stations/new'
    fill_in 'Name', :with => ''
    click_button 'Create Station'
    expect(page).to have_content 'error'
  end
end
