# coding: utf-8
class FrutosecosController < ApplicationController
  #http_basic_authenticate_with name: "vicente", password: "vicente"#, except: :index
  #http_basic_authenticate_with name: "vicente", password: "vicente", except: :index
  before_action :set_frutoseco, only: [:show, :edit, :update, :destroy]
  #before_update :copiar_registro
  
  #========================================================================================================================================================================
  def enviar_correo
    UserNotifier.test_email.deliver_now
    #UserNotifier.rellenar_y_enviar
    respond_to do |format|
      #nos pasamos a AJAX!
      #format.html { #redirect_to :root, :flash => { :success => 'Correo(s) enviado(s) con exito' } }
      #Necesario para mostrar el aviso
      format.js { flash.now[:success] = 'Correo(s) enviado(s) con exito' }
    end
  end
  #========================================================================================================================================================================
  # GET /frutosecos
  # GET /frutosecos.json
  def index
    @frutosecos = Frutoseco.all
    #@frutoseco = Frutoseco.find(params[:id])
  end
  #========================================================================================================================================================================
  # GET /frutosecos/1
  # GET /frutosecos/1.json
  def show
  end
  #========================================================================================================================================================================
  # GET /frutosecos/new
  def new
    @frutoseco = Frutoseco.new
  end
  #========================================================================================================================================================================
  # GET /frutosecos/1/edit
  def edit
    #redirect_to :root
    respond_to do |format|
      format.html { redirect_to :root} 
      format.js   {render :js => "window.location = '/frutosecos'" }#{ redirect_to :root}
    end
  end
  #========================================================================================================================================================================
  # POST /frutosecos
  # POST /frutosecos.json
  def create
    @frutoseco = Frutoseco.new(frutoseco_params)

    respond_to do |format|
      if @frutoseco.save
        format.html { redirect_to @frutoseco, notice: 'Frutoseco was successfully created.' }
        format.json { render :show, status: :created, location: @frutoseco }
      else
        format.html { render :new }
        format.json { render json: @frutoseco.errors, status: :unprocessable_entity }
      end
    end
  end
  #========================================================================================================================================================================
  # PATCH/PUT /frutosecos/1
  # PATCH/PUT /frutosecos/1.json
  def update #+ Histórico
    
    #Historico > Copia de registro antes del update
    copia = @frutoseco.dup
   
    respond_to do |format|      
      if @frutoseco.update(frutoseco_params)
        
         #Historico > Se añade la linea a la tabla Historico
         Historico.create(copia.attributes)
        
        #copia.save -> esto hace que se cree un nuevo row en Frutoseco. noooooo
        
        format.html { redirect_to :root, :flash => { :success => 'El precio de la almendra ' + @frutoseco.nombrefrutoseco + ' ha sido actualizado' }}
        format.js   { redirect_to :root }
        format.json
        
        #format.js { redirect_to root_url }
        #format.json { render :show, status: :ok, location: @frutoseco }
      else
        format.html { render 'error' }
        format.json { render json: @frutoseco.errors, status: :unprocessable_entity }
      end
    end
  end
  #========================================================================================================================================================================
  # ----------------------------------------------------------------------------------
  #no se usa ya, cambiado por form_for :remote => true
  #ya no uso form_for :remote => true por el rollo de no ver las notificaciones.
  def update_ajax
      @frutoseco = Frutoseco.find(params[:id])
        
      precio = params[:preciofrutoseco]
      
      @frutoseco.preciofrutoseco = precio
      
      logger.info 'Cucu'
      logger.info params[:frutoseco][:preciofrutoseco]
      
      #@frutoseco.save
      
      respond_to do |format|
      if @frutoseco.update(frutoseco_update_params)
        #format.js { render 'update_ajax', status: :ok, location: @frutoseco }
        format.js { redirect_to root }
        format.html { redirect_to root }
      else
        format.js { render json: @frutoseco.errors, status: :unprocessable_entity }
      end
    end
  end
  #========================================================================================================================================================================
  # ----------------------------------------------------------------------------------
  # DELETE /frutosecos/1
  # DELETE /frutosecos/1.json
  def destroy
    @frutoseco.destroy
    respond_to do |format|
      format.html { redirect_to frutosecos_url, notice: 'Frutoseco was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
#========================================================================================================================================================================
#========================================================================================================================================================================
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_frutoseco
      @frutoseco = Frutoseco.find(params[:id])
    end
#========================================================================================================================================================================
    # Never trust parameters from the scary internet, only allow the white list through.
    def frutoseco_params
      params.require(:frutoseco).permit(:nombrefrutoseco, :preciofrutoseco)
    end
#========================================================================================================================================================================
#ya no se usa, linkado con update_ajax
    def frutoseco_update_params
      params.permit(:id,:nombrefrutoseco,:preciofrutoseco)
    end 
 #========================================================================================================================================================================
 #Ya no se usa   
  def copiar_registro
    logger.info 'Aqui se copia el registro'
  end
#========================================================================================================================================================================    
end
