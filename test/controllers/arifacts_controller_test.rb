require 'test_helper'

class ArifactsControllerTest < ActionController::TestCase
  setup do
    @arifact = arifacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arifacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create arifact" do
    assert_difference('Arifact.count') do
      post :create, arifact: { key: @arifact.key, name: @arifact.name, project_id: @arifact.project_id }
    end

    assert_redirected_to arifact_path(assigns(:arifact))
  end

  test "should show arifact" do
    get :show, id: @arifact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @arifact
    assert_response :success
  end

  test "should update arifact" do
    patch :update, id: @arifact, arifact: { key: @arifact.key, name: @arifact.name, project_id: @arifact.project_id }
    assert_redirected_to arifact_path(assigns(:arifact))
  end

  test "should destroy arifact" do
    assert_difference('Arifact.count', -1) do
      delete :destroy, id: @arifact
    end

    assert_redirected_to arifacts_path
  end
end
