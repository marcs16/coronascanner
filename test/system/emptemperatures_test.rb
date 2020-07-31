require "application_system_test_case"

class EmptemperaturesTest < ApplicationSystemTestCase
  setup do
    @emptemperature = emptemperatures(:one)
  end

  test "visiting the index" do
    visit emptemperatures_url
    assert_selector "h1", text: "Emptemperatures"
  end

  test "creating a Emptemperature" do
    visit emptemperatures_url
    click_on "New Emptemperature"

    fill_in "Adress", with: @emptemperature.adress
    fill_in "Day and time", with: @emptemperature.day_and_time
    fill_in "Done by", with: @emptemperature.done_by
    fill_in "Full name", with: @emptemperature.full_name
    fill_in "Phone", with: @emptemperature.phone
    fill_in "Symptoms", with: @emptemperature.symptoms
    fill_in "Temperature", with: @emptemperature.temperature
    click_on "Create Emptemperature"

    assert_text "Emptemperature was successfully created"
    click_on "Back"
  end

  test "updating a Emptemperature" do
    visit emptemperatures_url
    click_on "Edit", match: :first

    fill_in "Adress", with: @emptemperature.adress
    fill_in "Day and time", with: @emptemperature.day_and_time
    fill_in "Done by", with: @emptemperature.done_by
    fill_in "Full name", with: @emptemperature.full_name
    fill_in "Phone", with: @emptemperature.phone
    fill_in "Symptoms", with: @emptemperature.symptoms
    fill_in "Temperature", with: @emptemperature.temperature
    click_on "Update Emptemperature"

    assert_text "Emptemperature was successfully updated"
    click_on "Back"
  end

  test "destroying a Emptemperature" do
    visit emptemperatures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Emptemperature was successfully destroyed"
  end
end
