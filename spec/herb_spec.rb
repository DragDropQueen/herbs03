require 'spec_helper'
require_relative '../herb_app'

Capybara.app = HerbApp

feature "User can manage herb cache" do
  scenario "User can add herb to list" do
    visit '/'
    herb_name = "motherwort"
    expect(page).to have_no_content(herb_name)
    fill_in "Herb Name", with: herb_name
    click_on "Collect"
    expect(page).to have_content(herb_name)
  end
end