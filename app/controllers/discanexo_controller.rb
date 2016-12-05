class DiscanexoController < ApplicationController


# GET /discanexos
# GET /discanexos.json
def index
	@discipline = Discipline.find(params[:Discipline_id])
	@discanexos = @discipline.discanexos
	respond_to do |format|
		format.html { redirect_to disciplines_path }
		format.json { render json: @discanexos }
	end
end
# GET /discanexos/1
# GET /discanexos/1.json
def show
	@discanexo = Discanexo.find(params[:id])
	respond_to do |format|
		format.html { redirect_to disciplines_path }
		format.json { render json: @discanexo }
	end
end
# GET /discanexos/new
# GET /discanexos/new.json
def new
	@discipline = Discipline.find(params[:Discipline_id])
	@discanexo = @discipline.discanexos.build
	respond_to do |format|
		format.html { redirect_to disciplines_path }
		format.json { render json: @discanexo }
	end
end
# GET /discanexos/1/edit
def edit
#@discipline = Discipline.find(params[:Discipline_id])
@discanexo = Discanexo.find(params[:id])
# @discanexo = Discanexo.find(params[:id])
end
# POST /discanexos
# POST /discanexos.json
def create
	@discanexo = Discanexo.new(params[:discanexo])
	if @discanexo.save
		respond_to do |format|
			format.html {
				render :json => [@discanexo.to_jq_upload].to_json,
				:content_type => 'text/html',
				:layout => false
			}
			format.json {
				render :json => [@discanexo.to_jq_upload].to_json
			}
		end
	else
		render :json => [{:error => "custom_failure"}], :status => 304
	end
end
# PUT /discanexos/1
# PUT /discanexos/1.json
def update
	@discipline = Discipline.find(params[:Discipline_id])
	@discanexo = @discipline.discanexos.find(params[:id])
	respond_to do |format|
		if @discanexo.update_attributes(discanexo_params)
			format.html { redirect_to discipline_path(@discipline), notice: 'Discanexo was successfully updated.' }
			format.json { head :no_content }
		else
			format.html { render action: "edit" }
			format.json { render json: @discanexo.errors, status: :unprocessable_entity }
		end
	end
end
# DELETE /discanexos/1
# DELETE /discanexos/1.json
def destroy
#@discipline = Discipline.find(params[:Discipline_id])
#@discanexo = @discipline.discanexos.find(params[:id])
@discanexo = Discanexo.find(params[:id])
@discanexo.destroy
flash[:success] = 'Anexo excluído com sucesso.'
respond_to do |format|
	format.html { redirect_to disciplines_path }
	format.js
end
end

private
def discanexo_params
	params.require(:discanexo).permit(:Discipline_id, :anexo)
end
end
