require "test_helper"

class ServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get getall" do
    get services_getall_url
    assert_response :success
  end

  test "should get getter" do
    get services_getter_url
    assert_response :success
  end

  test "should get creator" do
    get services_creator_url
    assert_response :success
  end

  test "should get updator" do
    get services_updator_url
    assert_response :success
  end
end
