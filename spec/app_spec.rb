require 'spec_helper'

def input_two_parks

  visit "/add_info"
  fill_in 'id', with: '546'
  fill_in 'name', with: 'Kalahari Resorts'
  fill_in 'city', with: 'Wisconsin Dells'
  fill_in 'state', with: 'Wisconsin'
  fill_in 'state', with: 'United States'
  click_button 'Submit'

  visit "/add_info"
  fill_in 'id', with: '547'
  fill_in 'name', with: 'Little Amerricka'
  fill_in 'city', with: 'Marshall'
  fill_in 'state', with: 'Wisconsin'
  fill_in 'state', with: 'United States'
  click_button 'Submit'

end

def input_three_parks
  [
      {
          :id=>546,
          :name=>"Kalahari Resorts",
          :city=>"Wisconsin Dells",
          :state=>"Wisconsin",
          :country=>"United States"
      },
      {
          :id=>547,
          :name=>"Little Amerricka",
          :city=>"Marshall",
          :state=>"Wisconsin",
          :country=>"United States"
      },
      {
          :id=>2,
          :name=>"Calaway Park",
          :city=>"Calgary",
          :state=>"Alberta",
          :country=>"Canada"
      }
  ]
end

feature "homepage" do
  scenario "select database" do
    visit "/"
    expect(page).to have_content("Two Parks Three Parks")
  end
  scenario "search bar" do
    visit "/"
    expect(page).to have_content("Find park by ID:")
  end
end

feature "two parks" do
  scenario "add two parks" do
    input_two_parks
  end
end