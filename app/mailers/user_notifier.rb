class UserNotifier < ApplicationMailer
  
  #-----------------------------------------------------------------------------------------------------------------------------  
  #Test Correo (usado en produccion, vamos que esta es el metodo que envia correo de verdad)
  #Cambiar nombre algun dia
  #Al parecer , este metodo no permite usar @destinatario.nombre en el cuerpo del correo
  #test_email.html.erb / test_email.text.erb
  #frutosecos_controller > enviar_correo
  def test_email
    #para listar los precios en el correo
    @frutosecos = Frutoseco.all
    #lista de todos los destinatarios de correo
    @destinatarios = Listacorreo.all
    @url  = ''
    emails = @destinatarios.collect(&:email).join(",")  
    mail(bcc: emails, subject: "Precio de la Almendra a fecha #{Date.today.strftime('%d-%m-%Y')}") #añadir fecha al asunto
  end
  #-----------------------------------------------------------------------------------------------------------------------------
  
  #REVISAR_ALGUN_DIA
  #Llenar lista de destinatarios
  #No consigo que funcione, solo envia correo al ultimo, o no envia
  def rellenar_y_enviar
    @frutosecos = Frutoseco.all    
    @destinatarios = Listacorreo.all
    @url  = ''
    @destinatarios.each do |destinatario|
      envio_email.deliver_now
    end
  end
  #Enviar fisicamente el correo
  def envio_email
     mail(to: destinatario.email, subject: "Precio de la Almendra a fecha #{Date.today.strftime('%d-%m-%Y')}")
  end
  #-----------------------------------------------------------------------------------------------------------------------------
  
end
