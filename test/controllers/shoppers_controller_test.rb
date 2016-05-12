require 'test_helper'

class ShoppersControllerTest < ActionController::TestCase
  setup do
    @shopper = shoppers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shoppers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shopper" do
    assert_difference('Shopper.count') do
      post :create, shopper: { cart: @shopper.cart, name: @shopper.name, username: @shopper.username }
    end

    assert_redirected_to shopper_path(assigns(:shopper))
  end

  test "should show shopper" do
    get :show, id: @shopper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shopper
    assert_response :success
  end

  test "should update shopper" do
    patch :update, id: @shopper, shopper: { cart: @shopper.cart, name: @shopper.name, username: @shopper.username }
    assert_redirected_to shopper_path(assigns(:shopper))
  end

  test "should destroy shopper" do
    assert_difference('Shopper.count', -1) do
      delete :destroy, id: @shopper
    end

    assert_redirected_to shoppers_path
  end
end
