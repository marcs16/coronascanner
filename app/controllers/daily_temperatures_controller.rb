class DailyTemperaturesController < ApplicationController
  before_action :set_daily_temperature, only: [:show, :edit, :update, :destroy]

  # GET /daily_temperatures
  # GET /daily_temperatures.json
  def index
    respond_to do |format|
      format.html
     format.json {render json: DailyTemperatureDatatable.new(params,{ view_context: view_context,edit: edit_daily_temperature_path('_'),show: daily_temperature_path('_')})}

    end
  end

  # GET /daily_temperatures/1
  # GET /daily_temperatures/1.json
  def show
    
  end

  # GET /daily_temperatures/new
  def new
    @daily_temperature = DailyTemperature.new
  end

  # GET /daily_temperatures/1/edit
  def edit
    

  end

  # POST /daily_temperatures
  # POST /daily_temperatures.json
  def create
    @daily_temperature = DailyTemperature.new(daily_temperature_params)

    respond_to do |format|
      if @daily_temperature.save
        format.html { redirect_to @daily_temperature, notice: 'Daily temperature was successfully created.' }
        format.json { render :show, status: :created, location: @daily_temperature }
      else
        format.html { render :new }
        format.json { render json: @daily_temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_temperatures/1
  # PATCH/PUT /daily_temperatures/1.json
  def update
    respond_to do |format|
      if @daily_temperature.update(daily_temperature_params)
        format.html { redirect_to @daily_temperature, notice: 'Daily temperature was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_temperature }
      else
        format.html { render :edit }
        format.json { render json: @daily_temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_temperatures/1
  # DELETE /daily_temperatures/1.json
  def destroy
    @daily_temperature.destroy
    respond_to do |format|
      format.html { redirect_to daily_temperatures_url, notice: 'Daily temperature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def export_xlxs_daily
    @daily_temperatures= DailyTemperature.where(id: params[:id])
    temp = DailyTemperature.where.not(id: params[:id])
    @daily_temperatures += temp
    render xlsx: 'Reporte de tomas de temperatura empleados ', 
            template: 'reports/temperatures_employes.xlsx.axlsx'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_temperature
      @daily_temperature = DailyTemperature.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_temperature_params
      params.require(:daily_temperature).permit(:done_by, :day_and_time, :full_name, :phone, :address, :temperature, :symptom)
    end
end
