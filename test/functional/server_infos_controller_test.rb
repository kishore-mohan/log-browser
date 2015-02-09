require 'test_helper'

class ServerInfosControllerTest < ActionController::TestCase
  setup do
    @server_info = server_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:server_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create server_info" do
    assert_difference('ServerInfo.count') do
      post :create, server_info: {  }
    end

    assert_redirected_to server_info_path(assigns(:server_info))
  end

  test "should show server_info" do
    get :show, id: @server_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @server_info
    assert_response :success
  end

  test "should update server_info" do
    put :update, id: @server_info, server_info: {  }
    assert_redirected_to server_info_path(assigns(:server_info))
  end

  test "should destroy server_info" do
    assert_difference('ServerInfo.count', -1) do
      delete :destroy, id: @server_info
    end

    assert_redirected_to server_infos_path
  end
end
