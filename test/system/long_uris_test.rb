require "application_system_test_case"

class LongUrisTest < ApplicationSystemTestCase
  setup do
    @long_uri = long_uris(:one)
  end

  test "visiting the index" do
    visit long_uris_url
    assert_selector "h1", text: "Long Uris"
  end

  test "creating a Long uri" do
    visit long_uris_url
    click_on "New Long Uri"

    fill_in "Hits", with: @long_uri.hits
    fill_in "Org url", with: @long_uri.org_url
    fill_in "Protocol", with: @long_uri.protocol_id
    fill_in "Short url", with: @long_uri.short_url
    click_on "Create Long uri"

    assert_text "Long uri was successfully created"
    click_on "Back"
  end

  test "updating a Long uri" do
    visit long_uris_url
    click_on "Edit", match: :first

    fill_in "Hits", with: @long_uri.hits
    fill_in "Org url", with: @long_uri.org_url
    fill_in "Protocol", with: @long_uri.protocol_id
    fill_in "Short url", with: @long_uri.short_url
    click_on "Update Long uri"

    assert_text "Long uri was successfully updated"
    click_on "Back"
  end

  test "destroying a Long uri" do
    visit long_uris_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Long uri was successfully destroyed"
  end
end
