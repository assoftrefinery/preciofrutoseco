require 'test_helper'

class ListacorreosControllerTest < ActionController::TestCase
  setup do
    @listacorreo = listacorreos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listacorreos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listacorreo" do
    assert_difference('Listacorreo.count') do
      post :create, listacorreo: { email: @listacorreo.email, nombre: @listacorreo.nombre }
    end

    assert_redirected_to listacorreo_path(assigns(:listacorreo))
  end

  test "should show listacorreo" do
    get :show, id: @listacorreo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listacorreo
    assert_response :success
  end

  test "should update listacorreo" do
    patch :update, id: @listacorreo, listacorreo: { email: @listacorreo.email, nombre: @listacorreo.nombre }
    assert_redirected_to listacorreo_path(assigns(:listacorreo))
  end

  test "should destroy listacorreo" do
    assert_difference('Listacorreo.count', -1) do
      delete :destroy, id: @listacorreo
    end

    assert_redirected_to listacorreos_path
  end
end
