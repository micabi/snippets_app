require 'test_helper'

class SnippetAppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @snippet_app = snippet_apps(:one)
  end

  test "should get index" do
    get snippet_apps_url
    assert_response :success
  end

  test "should get new" do
    get new_snippet_app_url
    assert_response :success
  end

  test "should create snippet_app" do
    assert_difference('SnippetApp.count') do
      post snippet_apps_url, params: { snippet_app: { contents: @snippet_app.contents, language: @snippet_app.language, title: @snippet_app.title } }
    end

    assert_redirected_to snippet_app_url(SnippetApp.last)
  end

  test "should show snippet_app" do
    get snippet_app_url(@snippet_app)
    assert_response :success
  end

  test "should get edit" do
    get edit_snippet_app_url(@snippet_app)
    assert_response :success
  end

  test "should update snippet_app" do
    patch snippet_app_url(@snippet_app), params: { snippet_app: { contents: @snippet_app.contents, language: @snippet_app.language, title: @snippet_app.title } }
    assert_redirected_to snippet_app_url(@snippet_app)
  end

  test "should destroy snippet_app" do
    assert_difference('SnippetApp.count', -1) do
      delete snippet_app_url(@snippet_app)
    end

    assert_redirected_to snippet_apps_url
  end
end
