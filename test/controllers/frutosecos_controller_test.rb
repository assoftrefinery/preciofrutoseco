require 'test_helper'

class FrutosecosControllerTest < ActionController::TestCase
  setup do
    @frutoseco = frutosecos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frutosecos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frutoseco" do
    assert_difference('Frutoseco.count') do
      post :create, frutoseco: { nombrefrutoseco: @frutoseco.nombrefrutoseco, preciofrutoseco: @frutoseco.preciofrutoseco }
    end

    assert_redirected_to frutoseco_path(assigns(:frutoseco))
  end

  test "should show frutoseco" do
    get :show, id: @frutoseco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frutoseco
    assert_response :success
  end

  test "should update frutoseco" do
    patch :update, id: @frutoseco, frutoseco: { nombrefrutoseco: @frutoseco.nombrefrutoseco, preciofrutoseco: @frutoseco.preciofrutoseco }
    assert_redirected_to frutoseco_path(assigns(:frutoseco))
  end

  test "should destroy frutoseco" do
    assert_difference('Frutoseco.count', -1) do
      delete :destroy, id: @frutoseco
    end

    assert_redirected_to frutosecos_path
  end
end
