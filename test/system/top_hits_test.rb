require "application_system_test_case"

class TopHitsTest < ApplicationSystemTestCase
  setup do
    @top_hit = top_hits(:one)
  end

  test "visiting the index" do
    visit top_hits_url
    assert_selector "h1", text: "Top Hits"
  end

  test "creating a Top hit" do
    visit top_hits_url
    click_on "New Top Hit"

    fill_in "Hits", with: @top_hit.hits
    fill_in "Short url", with: @top_hit.short_url
    fill_in "Title", with: @top_hit.title
    click_on "Create Top hit"

    assert_text "Top hit was successfully created"
    click_on "Back"
  end

  test "updating a Top hit" do
    visit top_hits_url
    click_on "Edit", match: :first

    fill_in "Hits", with: @top_hit.hits
    fill_in "Short url", with: @top_hit.short_url
    fill_in "Title", with: @top_hit.title
    click_on "Update Top hit"

    assert_text "Top hit was successfully updated"
    click_on "Back"
  end

  test "destroying a Top hit" do
    visit top_hits_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Top hit was successfully destroyed"
  end
end
