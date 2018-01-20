require 'test_helper'

class WorkControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get choose_theme" do
    get :choose_theme
    assert_response :success
  end

  test "should get display_theme" do
    get :display_theme
    assert_response :success
  end

end
