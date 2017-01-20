class ListacorreosController < ApplicationController
  before_action :set_listacorreo, only: [:show, :edit, :update, :destroy]

  # GET /listacorreos
  # GET /listacorreos.json
  def index
    @listacorreos = Listacorreo.all
  end

  # GET /listacorreos/1
  # GET /listacorreos/1.json
  def show
  end

  # GET /listacorreos/new
  def new
    @listacorreo = Listacorreo.new
  end

  # GET /listacorreos/1/edit
  def edit
  end

  # POST /listacorreos
  # POST /listacorreos.json
  def create
    @listacorreo = Listacorreo.new(listacorreo_params)

    respond_to do |format|
      if @listacorreo.save
        format.html { redirect_to @listacorreo, :flash => { :success => 'Destinatario de correo actualizado' }}
        format.json { render :show, status: :created, location: @listacorreo }
      else
        format.html { render :new }
        format.json { render json: @listacorreo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listacorreos/1
  # PATCH/PUT /listacorreos/1.json
  def update
    respond_to do |format|
      if @listacorreo.update(listacorreo_params)
        format.html { redirect_to @listacorreo, :flash => { :success => 'Destinatario de correo actualizado' }}
        format.json { render :show, status: :ok, location: @listacorreo }
      else
        format.html { render :edit }
        format.json { render json: @listacorreo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listacorreos/1
  # DELETE /listacorreos/1.json
  def destroy
    @listacorreo.destroy
    respond_to do |format|
      format.html { redirect_to listacorreos_url, notice: 'Destinatario de correo borrado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listacorreo
      @listacorreo = Listacorreo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listacorreo_params
      params.require(:listacorreo).permit(:nombre, :email)
    end
end
