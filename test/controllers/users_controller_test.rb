require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @newuser = User.new name: "New User", email: "t@t.com", password: "Password1"
    login
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @newuser.email, name: @newuser.name, password: @newuser.password, password_confirmation: @newuser.password } }
    end

    assert_redirected_to users_path # user_url(User.last)
  end

  test "should not create user with existing name" do
    assert_difference('User.count', 0) do
      post users_url, params: { user: { email: @user.email, name: @user.name, password: @newuser.password, password_confirmation: @newuser.password } }
    end

    assert_response :unprocessable_entity
  end

  test "should not create user with no name" do
    assert_difference('User.count', 0) do
      post users_url, params: { user: { email: @user.email, name: " ", password: @newuser.password, password_confirmation: @newuser.password } }
      post users_url, params: { user: { email: @user.email, name: " ", password: @newuser.password, password_confirmation: @newuser.password } }
    end

    assert_response :unprocessable_entity
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name, password: @newuser.password, password_confirmation: @newuser.password  } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
