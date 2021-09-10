require "test_helper"

class PlayerHomeControllerTest < ActionDispatch::IntegrationTest
  def setup
    login
  end
  test "should get index" do
    get home_url
    assert_response :success
  end
end
