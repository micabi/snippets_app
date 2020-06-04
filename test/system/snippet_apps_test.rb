require "application_system_test_case"

class SnippetAppsTest < ApplicationSystemTestCase
  setup do
    @snippet_app = snippet_apps(:one)
  end

  test "visiting the index" do
    visit snippet_apps_url
    assert_selector "h1", text: "Snippet Apps"
  end

  test "creating a Snippet app" do
    visit snippet_apps_url
    click_on "New Snippet App"

    fill_in "Contents", with: @snippet_app.contents
    fill_in "Language", with: @snippet_app.language
    fill_in "Title", with: @snippet_app.title
    click_on "Create Snippet app"

    assert_text "Snippet app was successfully created"
    click_on "Back"
  end

  test "updating a Snippet app" do
    visit snippet_apps_url
    click_on "Edit", match: :first

    fill_in "Contents", with: @snippet_app.contents
    fill_in "Language", with: @snippet_app.language
    fill_in "Title", with: @snippet_app.title
    click_on "Update Snippet app"

    assert_text "Snippet app was successfully updated"
    click_on "Back"
  end

  test "destroying a Snippet app" do
    visit snippet_apps_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Snippet app was successfully destroyed"
  end
end
