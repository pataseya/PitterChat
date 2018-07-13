require 'test_helper'

class EpicenterControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    get epicenter_feed_url
    assert_response :success
  end

  test "should get show_user" do
    get epicenter_show_user_url
    assert_response :success
  end

  test "should get now_follow" do
    get epicenter_now_follow_url
    assert_response :success
  end

  test "should get unfollow" do
    get epicenter_unfollow_url
    assert_response :success
  end

end
