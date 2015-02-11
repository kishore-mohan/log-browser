require 'test_helper'

class ChefMappingsControllerTest < ActionController::TestCase
  setup do
    @chef_mapping = chef_mappings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chef_mappings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chef_mapping" do
    assert_difference('ChefMapping.count') do
      post :create, chef_mapping: { cookbook_ref: @chef_mapping.cookbook_ref, git_url: @chef_mapping.git_url, tool_name: @chef_mapping.tool_name, version: @chef_mapping.version }
    end

    assert_redirected_to chef_mapping_path(assigns(:chef_mapping))
  end

  test "should show chef_mapping" do
    get :show, id: @chef_mapping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @chef_mapping
    assert_response :success
  end

  test "should update chef_mapping" do
    put :update, id: @chef_mapping, chef_mapping: { cookbook_ref: @chef_mapping.cookbook_ref, git_url: @chef_mapping.git_url, tool_name: @chef_mapping.tool_name, version: @chef_mapping.version }
    assert_redirected_to chef_mapping_path(assigns(:chef_mapping))
  end

  test "should destroy chef_mapping" do
    assert_difference('ChefMapping.count', -1) do
      delete :destroy, id: @chef_mapping
    end

    assert_redirected_to chef_mappings_path
  end
end
