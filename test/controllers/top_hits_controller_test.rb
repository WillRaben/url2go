require 'test_helper'

class TopHitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @top_hit = top_hits(:one)
  end

  test "should get index" do
    get top_hits_url
    assert_response :success
  end

  test "should get new" do
    get new_top_hit_url
    assert_response :success
  end

  test "should create top_hit" do
    assert_difference('TopHit.count') do
      post top_hits_url, params: { top_hit: { hits: @top_hit.hits, short_url: @top_hit.short_url, title: @top_hit.title } }
    end

    assert_redirected_to top_hit_url(TopHit.last)
  end

  test "should show top_hit" do
    get top_hit_url(@top_hit)
    assert_response :success
  end

  test "should get edit" do
    get edit_top_hit_url(@top_hit)
    assert_response :success
  end

  test "should update top_hit" do
    patch top_hit_url(@top_hit), params: { top_hit: { hits: @top_hit.hits, short_url: @top_hit.short_url, title: @top_hit.title } }
    assert_redirected_to top_hit_url(@top_hit)
  end

  test "should destroy top_hit" do
    assert_difference('TopHit.count', -1) do
      delete top_hit_url(@top_hit)
    end

    assert_redirected_to top_hits_url
  end
end
