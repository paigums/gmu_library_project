require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should login" do
    dave = users(:one)
    post :create, name: eric.name, password: 'secret', admin: false, user_id: 'eoboite'
    assert_redirected_to books_url
    assert_equal eric.id, session[:user_id]
  end

  test "should fail login" do
    dave = users(:one)
    post :create, name: eric.name, password: 'wrong', admin: true, user_id: 'eoboite'
    assert_redirected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to store_url
  end

end
