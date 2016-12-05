require 'test_helper'

class ProgressQuestionsControllerTest < ActionController::TestCase
  setup do
    @progress_question = progress_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:progress_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create progress_question" do
    assert_difference('ProgressQuestion.count') do
      post :create, progress_question: { question_id: @progress_question.question_id, resposta: @progress_question.resposta, status: @progress_question.status, user_id: @progress_question.user_id }
    end

    assert_redirected_to progress_question_path(assigns(:progress_question))
  end

  test "should show progress_question" do
    get :show, id: @progress_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @progress_question
    assert_response :success
  end

  test "should update progress_question" do
    patch :update, id: @progress_question, progress_question: { question_id: @progress_question.question_id, resposta: @progress_question.resposta, status: @progress_question.status, user_id: @progress_question.user_id }
    assert_redirected_to progress_question_path(assigns(:progress_question))
  end

  test "should destroy progress_question" do
    assert_difference('ProgressQuestion.count', -1) do
      delete :destroy, id: @progress_question
    end

    assert_redirected_to progress_questions_path
  end
end
