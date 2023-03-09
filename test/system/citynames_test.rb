require "application_system_test_case"

class CitynamesTest < ApplicationSystemTestCase
  setup do
    @cityname = citynames(:one)
  end

  test "visiting the index" do
    visit citynames_url
    assert_selector "h1", text: "Citynames"
  end

  test "should create cityname" do
    visit citynames_url
    click_on "New cityname"

    fill_in "Slug", with: @cityname.slug
    fill_in "Title", with: @cityname.title
    fill_in "User", with: @cityname.user_id
    click_on "Create Cityname"

    assert_text "Cityname was successfully created"
    click_on "Back"
  end

  test "should update Cityname" do
    visit cityname_url(@cityname)
    click_on "Edit this cityname", match: :first

    fill_in "Slug", with: @cityname.slug
    fill_in "Title", with: @cityname.title
    fill_in "User", with: @cityname.user_id
    click_on "Update Cityname"

    assert_text "Cityname was successfully updated"
    click_on "Back"
  end

  test "should destroy Cityname" do
    visit cityname_url(@cityname)
    click_on "Destroy this cityname", match: :first

    assert_text "Cityname was successfully destroyed"
  end
end
