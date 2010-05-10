require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "index" do
    get :index
    assert_redirected_to :action => "login"
    assert_equal "Please log in", flash[:notice]
  end

  test "index with user" do
    get :index, {}, { :user_id => users(:Adam).id }
    assert_response :success
    assert_template "index"
  end

  test "login" do
    me = users(:Adam)
    post :login, :name => me.name, :password => 'secret'
    assert_redirected_to :action => "index"
    assert_equal me.id, session[:user_id]
  end
end
