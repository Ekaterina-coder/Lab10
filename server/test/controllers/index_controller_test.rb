require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get '/3333', params: {format: :xml }
    assert_response :success
    assert_includes @response.headers['Content-Type'], 'application/xml'
  end

  test "should get 4 to palindrom" do
    get '/4'
    assert_equal assigns[:res], [[0,"0"],[1,"1"],[3,"11"]]
  end

  test "should get 0 to palindrom" do
    get '/0'
    assert_equal assigns[:res], [[0,"0"]]
  end

  test "should get 30 to palindrom" do
    get '/30'
    assert_equal assigns[:res], [[0,"0"],[1,"1"],[3,"11"],[5,"101"],[7,"111"],[9,"1001"]]
  end
end
