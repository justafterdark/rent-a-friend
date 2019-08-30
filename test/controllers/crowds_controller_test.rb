require 'test_helper'

class CrowdsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get crowds_new_url
    assert_response :success
  end

end
