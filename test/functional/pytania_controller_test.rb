require 'test_helper'

class PytaniaControllerTest < ActionController::TestCase
  setup do
    @pytanium = pytania(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pytania)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pytanium" do
    assert_difference('Pytanium.count') do
      post :create, pytanium: { content: @pytanium.content, parent_pytania_idtitle: @pytanium.parent_pytania_idtitle, status: @pytanium.status, user_id: @pytanium.user_id }
    end

    assert_redirected_to pytanium_path(assigns(:pytanium))
  end

  test "should show pytanium" do
    get :show, id: @pytanium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pytanium
    assert_response :success
  end

  test "should update pytanium" do
    put :update, id: @pytanium, pytanium: { content: @pytanium.content, parent_pytania_idtitle: @pytanium.parent_pytania_idtitle, status: @pytanium.status, user_id: @pytanium.user_id }
    assert_redirected_to pytanium_path(assigns(:pytanium))
  end

  test "should destroy pytanium" do
    assert_difference('Pytanium.count', -1) do
      delete :destroy, id: @pytanium
    end

    assert_redirected_to pytania_path
  end
end
