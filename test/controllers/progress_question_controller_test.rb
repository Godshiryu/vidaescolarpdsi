require 'test_helper'

class ProgressQuestionControllerTest < ActionController::TestCase
  test "should get user:references" do
    get :user:references
    assert_response :success
  end

  test "should get question:references" do
    get :question:references
    assert_response :success
  end

  test "should get resposta:string" do
    get :resposta:string
    assert_response :success
  end

  test "should get status:integer" do
    get :status:integer
    assert_response :success
  end

end
