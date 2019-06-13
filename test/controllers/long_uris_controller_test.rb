require 'test_helper'

class LongUrisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @long_uri = long_uris(:one)
  end

  test "should get index" do
    get long_uris_url
    assert_response :success
  end

  test "should get new" do
    get new_long_uri_url
    assert_response :success
  end

  test "should create long_uri" do
    assert_difference('LongUri.count') do
      post long_uris_url, params: { long_uri: { hits: @long_uri.hits, org_url: @long_uri.org_url, protocol_id: @long_uri.protocol_id, short_url: @long_uri.short_url } }
    end

    assert_redirected_to long_uri_url(LongUri.last)
  end

  test "should show long_uri" do
    get long_uri_url(@long_uri)
    assert_response :success
  end

  test "should get edit" do
    get edit_long_uri_url(@long_uri)
    assert_response :success
  end

  test "should update long_uri" do
    patch long_uri_url(@long_uri), params: { long_uri: { hits: @long_uri.hits, org_url: @long_uri.org_url, protocol_id: @long_uri.protocol_id, short_url: @long_uri.short_url } }
    assert_redirected_to long_uri_url(@long_uri)
  end

  test "should destroy long_uri" do
    assert_difference('LongUri.count', -1) do
      delete long_uri_url(@long_uri)
    end

    assert_redirected_to long_uris_url
  end
end
