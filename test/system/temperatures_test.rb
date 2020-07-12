require "application_system_test_case"

class TemperaturesTest < ApplicationSystemTestCase
  setup do
    @temperature = temperatures(:one)
  end

  test "visiting the index" do
    visit temperatures_url
    assert_selector "h1", text: "Temperatures"
  end

  test "creating a Temperature" do
    visit temperatures_url
    click_on "New Temperature"

    fill_in "Address", with: @temperature.address
    fill_in "Checked at", with: @temperature.checked_at
    fill_in "Checked by", with: @temperature.checked_by
    fill_in "Full name", with: @temperature.full_name
    fill_in "Phone", with: @temperature.phone
    fill_in "Status", with: @temperature.status
    fill_in "Temperature", with: @temperature.temperature
    click_on "Create Temperature"

    assert_text "Temperature was successfully created"
    click_on "Back"
  end

  test "updating a Temperature" do
    visit temperatures_url
    click_on "Edit", match: :first

    fill_in "Address", with: @temperature.address
    fill_in "Checked at", with: @temperature.checked_at
    fill_in "Checked by", with: @temperature.checked_by
    fill_in "Full name", with: @temperature.full_name
    fill_in "Phone", with: @temperature.phone
    fill_in "Status", with: @temperature.status
    fill_in "Temperature", with: @temperature.temperature
    click_on "Update Temperature"

    assert_text "Temperature was successfully updated"
    click_on "Back"
  end

  test "destroying a Temperature" do
    visit temperatures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Temperature was successfully destroyed"
  end
end
