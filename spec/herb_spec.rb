require 'spec_helper'
require_relative '../herb_app'

Capybara.app = HerbApp

feature "User can manage herb cache" do

  before do
    DB[:herb].delete
  end

  scenario "User can add herb to list and see list" do
    visit '/'
    herb_name = "motherwort"
    herb_part = "aerial parts"
    expect(page).to have_no_content(herb_name)
    fill_in "Herb Name", with: herb_name
    fill_in "Herb Part", with: herb_part
    click_on "Collect"
    expect(page).to have_content("Herbal Apothecary Collection")
    expect(page).to have_content(herb_name)
    expect(page).to have_content(herb_part)
  end

  scenario "User can update herbs" do
    visit '/'
    old_herb_name = "violets"
    old_herb_part = "aerial parts"
    new_herb_name = "violet"
    new_herb_part = "leaf and flower"
    fill_in "Herb Name", with: old_herb_name
    fill_in "Herb Part", with: old_herb_part
    click_on "Collect"
    expect(page).to have_content(old_herb_name)
    click_on "Update"
    fill_in "Herb Name", with: new_herb_name
    fill_in "Herb Part", with: new_herb_part
    click_on "Update"
    expect(page).to have_content("Herbal Apothecary Collection")
    expect(page).to have_content(new_herb_name)
    expect(page).to have_content(new_herb_part)
  end

  scenario "User can delete herbs" do
    visit '/'
    herb_name = "mugwort"
    herb_part = "aerial parts"
    expect(page).to have_no_content(herb_name)
    fill_in "Herb Name", with: herb_name
    fill_in "Herb Part", with: herb_part
    click_on "Collect"
    click_on "Delete"
    expect(page).to have_content("Herbal Apothecary Collection")
    expect(page).to have_no_content(herb_name)
    expect(page).to have_no_content(herb_part)

  end

end
