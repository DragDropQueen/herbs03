require 'spec_helper'
require_relative '../herb_app'

Capybara.app = HerbApp

feature "User can manage herb cache" do

  before do
    DB[:herb].delete
  end

  scenario "User can add herb to list" do
    visit '/'
    herb_name = "motherwort"
    herb_part = "aerial parts"
    expect(page).to have_no_content(herb_name)
    fill_in "Herb Name", with: herb_name
    fill_in "Herb Part", with: herb_part
    click_on "Collect"
    expect(page).to have_content(herb_name)
    expect(page).to have_content(herb_part)
  end

end