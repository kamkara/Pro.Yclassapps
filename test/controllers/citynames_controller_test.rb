require "test_helper"

class CitynamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cityname = citynames(:one)
  end

  test "should get index" do
    get citynames_url
    assert_response :success
  end

  test "should get new" do
    get new_cityname_url
    assert_response :success
  end

  test "should create cityname" do
    assert_difference("Cityname.count") do
      post citynames_url, params: { cityname: { slug: @cityname.slug, title: @cityname.title, user_id: @cityname.user_id } }
    end

    assert_redirected_to cityname_url(Cityname.last)
  end

  test "should show cityname" do
    get cityname_url(@cityname)
    assert_response :success
  end

  test "should get edit" do
    get edit_cityname_url(@cityname)
    assert_response :success
  end

  test "should update cityname" do
    patch cityname_url(@cityname), params: { cityname: { slug: @cityname.slug, title: @cityname.title, user_id: @cityname.user_id } }
    assert_redirected_to cityname_url(@cityname)
  end

  test "should destroy cityname" do
    assert_difference("Cityname.count", -1) do
      delete cityname_url(@cityname)
    end

    assert_redirected_to citynames_url
  end
end
