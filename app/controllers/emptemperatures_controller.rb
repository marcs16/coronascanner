class EmptemperaturesController < ApplicationController
  before_action :set_emptemperature, only: [:show, :edit, :update, :destroy]

  # GET /emptemperatures
  # GET /emptemperatures.json
  def index
    @emptemperatures = Emptemperature.all
    respond_to do |format|
      format.html
      format.json {render json: EmptemperatureDatatable.new(params,{ show: emptemperature_path('_')})}
    end
  end

  # GET /emptemperatures/1
  # GET /emptemperatures/1.json
  def show
     @current_symptoms = JSON.parse(@emptemperature.symptoms)
  end

  # GET /emptemperatures/new
  def new
    @emptemperature = Emptemperature.new
  end

  # GET /emptemperatures/1/edit
  def edit
    @current_symptoms = JSON.parse(@emptemperature.symptoms)
  end

  # POST /emptemperatures
  # POST /emptemperatures.json
  def create
    @emptemperature = Emptemperature.new(emptemperature_params)

    respond_to do |format|
      if @emptemperature.save
        format.html { redirect_to @emptemperature, notice: 'Medición creada con exito.' }
        format.json { render :show, status: :created, location: @emptemperature }
      else
        format.html { render :new }
        format.json { render json: @emptemperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emptemperatures/1
  # PATCH/PUT /emptemperatures/1.json
  def update
    respond_to do |format|
      if @emptemperature.update(emptemperature_params)
        format.html { redirect_to @emptemperature, notice: 'Medición actualizada con exito.' }
        format.json { render :show, status: :ok, location: @emptemperature }
      else
        format.html { render :edit }
        format.json { render json: @emptemperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emptemperatures/1
  # DELETE /emptemperatures/1.json
  def destroy
    @emptemperature.destroy
    respond_to do |format|
      format.html { redirect_to emptemperatures_url, notice: 'Medición eliminada.' }
      format.json { head :no_content }
    end
  end

  def export_xlxs_employe_temperature
    @emptemperatures= Emptemperature.where(id: params[:id])
    temp = Emptemperature.where.not(id: params[:id])
    @emptemperatures += temp
    @emptemperatures.each do |emptemp|
       empt = JSON.parse(emptemp.symptoms)
       emptemp.symptoms = empt.reject(&:empty?).join(", ")
    end
    render xlsx: 'Reporte de tomas de temperatura empleados '+ Time.now.to_s, 
            template: 'reports/temperatures_employes.xlsx.axlsx'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emptemperature
      @emptemperature = Emptemperature.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def emptemperature_params
      params.require(:emptemperature).permit(:done_by, :day_and_time, :full_name, :phone, :address, :temperature, :symptoms => [])
    end
end
