require 'test_helper'

class ProgressThemesControllerTest < ActionController::TestCase
  setup do
    @progress_theme = progress_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:progress_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create progress_theme" do
    assert_difference('ProgressTheme.count') do
      post :create, progress_theme: { status: @progress_theme.status, theme_id: @progress_theme.theme_id, user_id: @progress_theme.user_id }
    end

    assert_redirected_to progress_theme_path(assigns(:progress_theme))
  end

  test "should show progress_theme" do
    get :show, id: @progress_theme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @progress_theme
    assert_response :success
  end

  test "should update progress_theme" do
    patch :update, id: @progress_theme, progress_theme: { status: @progress_theme.status, theme_id: @progress_theme.theme_id, user_id: @progress_theme.user_id }
    assert_redirected_to progress_theme_path(assigns(:progress_theme))
  end

  test "should destroy progress_theme" do
    assert_difference('ProgressTheme.count', -1) do
      delete :destroy, id: @progress_theme
    end

    assert_redirected_to progress_themes_path
  end
end
