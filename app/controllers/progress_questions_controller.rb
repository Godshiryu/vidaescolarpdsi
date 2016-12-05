class ProgressQuestionsController < ApplicationController
  before_action :set_progress_question, only: [:show, :edit, :update, :destroy]

  # GET /progress_questions
  # GET /progress_questions.json
  def index
    @progress_questions = ProgressQuestion.all
  end

  # GET /progress_questions/1
  # GET /progress_questions/1.json
  def show
  end

  # GET /progress_questions/new
  def new
    @progress_question = ProgressQuestion.new
  end

  # GET /progress_questions/1/edit
  def edit
  end

  # POST /progress_questions
  # POST /progress_questions.json
  def create
    @progress_question = ProgressQuestion.new(progress_question_params)
    @jarespondeu = ProgressQuestion.where("question_id = ?", progress_question_params['question_id']).find_by_user_id(current_user.id)
    
    temaid = Question.find(progress_question_params['question_id']).theme_id
    @progress_theme = ProgressTheme.where("theme_id = ?",temaid).find_by_user_id(current_user.id)
    @idAtual = progress_question_params['question_id']

    @questions = Question.where("theme_id = (?) ", temaid)
    if params[:commit] == "Anterior"
      @id = @questions
      .where("id < ?", @idAtual).last.try(:id)
    elsif params[:commit] == "Proximo"
      @id = @questions
      .where("id > ?", @idAtual).first.try(:id)
    end

    @jarespondeu.destroy if @jarespondeu
    if @progress_theme.nil?
      @progress_theme = ProgressTheme.new 
      @progress_theme.user_id = current_user.id
      @progress_theme.theme_id = temaid
      @progress_theme.status = 1
      @progress_theme.save
    end

    @respostaCerta = Question.find(progress_question_params['question_id']).resposta
    if progress_question_params['resposta'] == @respostaCerta
      @progress_question.status = 1
    else
      @progress_question.status = 2
    end

    @progress_question.status 

    respond_to do |format|
      if @progress_question.save
        if params[:commit] == "Finalizar"
          format.html { redirect_to themes_path}  
          @progress_theme.status = 2
          @progress_theme.save
        else
          format.html { redirect_to "http://localhost:3000/themes/#{temaid}/answer"} if @id.nil?
          format.html { redirect_to "http://localhost:3000/themes/#{temaid}/answer?ant=#{@id}"}
        end
        format.json { render :show, status: :created, location: @progress_question }
      else
        format.html { render :new }
        format.json { render json: @progress_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progress_questions/1
  # PATCH/PUT /progress_questions/1.json
  def update
    respond_to do |format|
      if @progress_question.update(progress_question_params)
        format.html { redirect_to @progress_question, notice: 'Progress question was successfully updated.' }
        format.json { render :show, status: :ok, location: @progress_question }
      else
        format.html { render :edit }
        format.json { render json: @progress_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progress_questions/1
  # DELETE /progress_questions/1.json
  def destroy
    @progress_question.destroy
    respond_to do |format|
      format.html { redirect_to progress_questions_url, notice: 'Progress question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progress_question
      @progress_question = ProgressQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def progress_question_params
      params.require(:progress_question).permit(:user_id, :question_id, :resposta, :status)
    end
  end
