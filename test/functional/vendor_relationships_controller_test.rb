require 'test_helper'

class VendorRelationshipsControllerTest < ActionController::TestCase
  setup do
    @vendor_relationship = vendor_relationships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendor_relationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendor_relationship" do
    assert_difference('VendorRelationship.count') do
      post :create, vendor_relationship: @vendor_relationship.attributes
    end

    assert_redirected_to vendor_relationship_path(assigns(:vendor_relationship))
  end

  test "should show vendor_relationship" do
    get :show, id: @vendor_relationship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendor_relationship
    assert_response :success
  end

  test "should update vendor_relationship" do
    put :update, id: @vendor_relationship, vendor_relationship: @vendor_relationship.attributes
    assert_redirected_to vendor_relationship_path(assigns(:vendor_relationship))
  end

  test "should destroy vendor_relationship" do
    assert_difference('VendorRelationship.count', -1) do
      delete :destroy, id: @vendor_relationship
    end

    assert_redirected_to vendor_relationships_path
  end
end
