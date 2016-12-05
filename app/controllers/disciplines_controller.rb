class DisciplinesController < ApplicationController
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]
  before_action :set_discipline_matricula, only: [:matricula]
  before_action :authenticate_user!


  # GET /disciplines
  # GET /disciplines.json
  def index
    if( current_user.admin? )
      @disciplines = Discipline.where( users_id: current_user.id)
      @discipline = Discipline.new
    else
      @disciplines = Discipline.joins(:Discuser).where("user_id = (?)", current_user.id)
      @discipline = Discipline.new
    end
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
  end

  # GET /disciplines/new
  def new
    @discipline = Discipline.new
  end

  # GET /disciplines/1/edit
  def edit
  end

  #
  def matricula
    disc = @discipline
    user = current_user

    Discuser.create( User: user, Discipline: disc)

    respond_to do |format|
      format.html { redirect_to @discipline, notice: 'Matricula realizada com sucesso.' }
    end

  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    @discipline = Discipline.new(discipline_params)
    @discipline.users_id = current_user.id

    respond_to do |format|
      if @discipline.save
        @discipline.codigo = "DISC-%04d" % [@discipline.id]
        @discipline.save
        if params[:anexos]

          params[:anexos].each { |anx|
            @discanexo = Discanexo.new
            @discanexo.anexo = anx
            @discanexo.Discipline_id = @discipline.id
            @discanexo.save
          }
        end
        flash[:success] = "Disciplina cadastrada com sucesso."
        format.html { redirect_to @discipline}
        format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplines/1
  # PATCH/PUT /disciplines/1.json
  def update
    respond_to do |format|
      @senha = @discipline.senha
      if @discipline.update(discipline_params)
        if @discipline.senha == ""
          @discipline.senha = @senha
          @discipline.update( senha: @senha)
        end
        if params[:anexos]

          params[:anexos].each { |anx|
            @discanexo = Discanexo.new
            @discanexo.anexo = anx
            @discanexo.Discipline_id = @discipline.id
            @discanexo.save
          }
        end
        flash[:success] = "Disciplina atualizada com sucesso."
        format.html { redirect_to disciplines_url}
        format.json { render :show, status: :ok, location: @discipline }
      else
        format.html { render :edit }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  def deleteAnexo
    respond_to do |format|
      format.html { redirect_to disciplines_url, notice: params[:toba].to_s}
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @discanexos = Discanexo.where("id in (?)", @discipline.discanexo_ids)
    if @discanexos
      @discanexos.each { |anx|
        anx.anexo = nil
        anx.save
      }
    end
    @discipline.save
    @discipline.destroy
    respond_to do |format|
      format.html { redirect_to disciplines_url, notice: 'Discipline was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_discipline
      @discipline = Discipline.find(params[:id])
    end

    def set_discipline_matricula
      @discipline = Discipline.find(params[:disciplineMat])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def discipline_params
      params.require(:discipline).permit(:nome, :cargahoraria, :Course_id, :users_id, :anexos, :disciplineMat, :senha)
    end

  end

