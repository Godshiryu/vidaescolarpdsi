class ProgressThemesController < ApplicationController
  before_action :set_progress_theme, only: [:show, :edit, :update, :destroy]

  # GET /progress_themes
  # GET /progress_themes.json
  def index
    @progress_themes = ProgressTheme.all
  end

  # GET /progress_themes/1
  # GET /progress_themes/1.json
  def show
  end

  # GET /progress_themes/new
  def new
    @progress_theme = ProgressTheme.new
  end

  # GET /progress_themes/1/edit
  def edit
  end

  # POST /progress_themes
  # POST /progress_themes.json
  def create
    @progress_theme = ProgressTheme.new(progress_theme_params)

    respond_to do |format|
      if @progress_theme.save
        format.html { redirect_to @progress_theme, notice: 'Progress theme was successfully created.' }
        format.json { render :show, status: :created, location: @progress_theme }
      else
        format.html { render :new }
        format.json { render json: @progress_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progress_themes/1
  # PATCH/PUT /progress_themes/1.json
  def update
    respond_to do |format|
      if @progress_theme.update(progress_theme_params)
        format.html { redirect_to @progress_theme, notice: 'Progress theme was successfully updated.' }
        format.json { render :show, status: :ok, location: @progress_theme }
      else
        format.html { render :edit }
        format.json { render json: @progress_theme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progress_themes/1
  # DELETE /progress_themes/1.json
  def destroy
    @progress_theme.destroy
    respond_to do |format|
      format.html { redirect_to progress_themes_url, notice: 'Progress theme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progress_theme
      @progress_theme = ProgressTheme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def progress_theme_params
      params.require(:progress_theme).permit(:user_id, :theme_id, :status)
    end
end
