require 'test_helper'

class ProfilePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get profile_pages_home_url
    assert_response :success
  end

  test "should get about" do
    get profile_pages_about_url
    assert_response :success
  end

end
