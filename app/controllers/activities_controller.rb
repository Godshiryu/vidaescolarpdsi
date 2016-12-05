class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /activities
  # GET /activities.json
  def index
    if( current_user.admin? )
      @activities = Activity.where("Discipline_id IN (?)", Discipline.where( users_id: current_user.id).ids).order(data: :asc)
      @activity = Activity.new
    else
      @activities = Activity.where("Discipline_id in (?)", Discipline.joins(:Discuser).where("user_id = (?)", current_user.id).ids)
      @activity = Activity.new
    end
    end

  def indexCalendar
    if current_user.admin?
      @activities = Activity.where("data >= ? and Discipline_id IN (?)",
          Time.zone.now.to_date, Discipline.where( users_id: current_user.id).ids).
          order(data: :asc).reverse_order.limit(5).reverse
    else
      @activities = Activity
        .where("data >= ? and Discipline_id in (?)",
          Time.zone.now.to_date,
          Discipline.joins(:Discuser)
            .where("user_id = (?)", current_user.id).ids)
        .order(data: :asc).reverse_order.limit(5).reverse
    end
    render 'indexCalendar' 
  end

    # GET /activities
  # GET /activities.json
  def indexRoot
    if current_user.admin?
      @activities = Activity.where("data >= ? and Discipline_id IN (?)",
          Time.zone.now.to_date, Discipline.where( users_id: current_user.id).ids).
          order(data: :asc).reverse_order.limit(5).reverse
    else
      @activities = Activity
        .where("data >= ? and Discipline_id in (?)",
          Time.zone.now.to_date,
          Discipline.joins(:Discuser)
            .where("user_id = (?)", current_user.id).ids)
        .order(data: :asc).reverse_order.limit(5).reverse
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show

  end

  # GET /activities/new
  def new
    @activity = Activity.new

  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities
  # POST /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        flash[:success] = 'Atividade criada com sucesso.'
        format.html { redirect_to @activity }
        format.json { render :show, status: :created, location: @activity }
      else
        flash[:danger] = 'Erro ao criar atividade'
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1
  # PATCH/PUT /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        flash[:success] = 'Atividade alterada com sucesso.'
        format.html { redirect_to activities_url }
        format.json { render :show, status: :ok, location: @activity }
      else
        flash[:danger] = 'Erro ao alterar atividade.'
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      flash[:success] = 'Atividade excluida com sucesso.'
      format.html { redirect_to activities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find( params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activity_params
      params.require(:activity).permit(:nome, :Discipline_id, :data)
    end
end
