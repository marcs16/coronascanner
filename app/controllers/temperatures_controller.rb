class TemperaturesController < ApplicationController
  before_action :set_temperature, only: [:show, :edit, :update, :destroy]

  # GET /temperatures
  # GET /temperatures.json
 
  def index
    @temperatures = Temperature.all
    respond_to do |format|
      format.html
      format.json {render json: TemperatureDatatable.new(params,{edit: edit_temperature_path('_'), show: temperature_path('_')})}
    end
  end

  # GET /temperatures/1
  # GET /temperatures/1.json
  def show
  end

  # GET /temperatures/new
  def new
    @temperature = Temperature.new
  end

  # GET /temperatures/1/edit
  def edit
  end

  # POST /temperatures
  # POST /temperatures.json
  def create
    @temperature = Temperature.new(temperature_params)

    respond_to do |format|
      if @temperature.save
        format.html { redirect_to @temperature, notice: 'Medición creada con exito.' }
        format.json { render :show, status: :created, location: @temperature }
      else
        format.html { render :new }
        format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temperatures/1
  # PATCH/PUT /temperatures/1.json
  def update
    respond_to do |format|
      if @temperature.update(temperature_params)
        format.html { redirect_to @temperature, notice: 'Medición actualizada.' }
        format.json { render :show, status: :ok, location: @temperature }
      else
        format.html { render :edit }
        format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temperatures/1
  # DELETE /temperatures/1.json
  def destroy
    @temperature.destroy
    respond_to do |format|
      format.html { redirect_to temperatures_url, notice: 'Medición eliminada con exito.' }
      format.json { head :no_content }
    end
  end

  def export_xlxs
    @temperature = Temperature.where(id: params[:id])
    temp = Temperature.where.not(id: params[:id])
    @temperature += temp
    render xlsx: 'Reporte de tomas de temperatura ', 
            template: 'reports/temperatures_list.xlsx.axlsx'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temperature
      @temperature = Temperature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def temperature_params
      params.require(:temperature).permit(:checked_by, :full_name, :checked_at, :address, :phone, :temperature, :status)
    end
end
