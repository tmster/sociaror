require 'test_helper'

class WykopsControllerTest < ActionController::TestCase
  setup do
    @wykop = wykops(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wykops)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wykop" do
    assert_difference('Wykop.count') do
      post :create, wykop: { status: @wykop.status, summary: @wykop.summary, title: @wykop.title, url: @wykop.url, user_id: @wykop.user_id }
    end

    assert_redirected_to wykop_path(assigns(:wykop))
  end

  test "should show wykop" do
    get :show, id: @wykop
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wykop
    assert_response :success
  end

  test "should update wykop" do
    put :update, id: @wykop, wykop: { status: @wykop.status, summary: @wykop.summary, title: @wykop.title, url: @wykop.url, user_id: @wykop.user_id }
    assert_redirected_to wykop_path(assigns(:wykop))
  end

  test "should destroy wykop" do
    assert_difference('Wykop.count', -1) do
      delete :destroy, id: @wykop
    end

    assert_redirected_to wykops_path
  end
end
