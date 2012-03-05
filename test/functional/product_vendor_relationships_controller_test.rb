require 'test_helper'

class ProductVendorRelationshipsControllerTest < ActionController::TestCase
  setup do
    @product_vendor_relationship = product_vendor_relationships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_vendor_relationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_vendor_relationship" do
    assert_difference('ProductVendorRelationship.count') do
      post :create, product_vendor_relationship: @product_vendor_relationship.attributes
    end

    assert_redirected_to product_vendor_relationship_path(assigns(:product_vendor_relationship))
  end

  test "should show product_vendor_relationship" do
    get :show, id: @product_vendor_relationship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_vendor_relationship
    assert_response :success
  end

  test "should update product_vendor_relationship" do
    put :update, id: @product_vendor_relationship, product_vendor_relationship: @product_vendor_relationship.attributes
    assert_redirected_to product_vendor_relationship_path(assigns(:product_vendor_relationship))
  end

  test "should destroy product_vendor_relationship" do
    assert_difference('ProductVendorRelationship.count', -1) do
      delete :destroy, id: @product_vendor_relationship
    end

    assert_redirected_to product_vendor_relationships_path
  end
end
