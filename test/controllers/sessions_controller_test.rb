require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should prompt for login" do
    get login_url
    assert_response :success
  end

  test "should login" do

    u = users(:one)

    post login_url, params: {name: u.name, password: 'Password1'}
    assert_redirected_to home_path
    assert_equal u.id, session[:user_id]
  end

  test "bad creds should fail login" do
    u = users(:one)

    post login_url, params: {name: u.name, password: 'BADPASSWORD'}
    assert_redirected_to login_path
    assert_nil session[:user_id]
  end

  test "should logout" do
    delete logout_path
    assert_redirected_to root_path
    assert_nil session[:user_id]
  end
end
