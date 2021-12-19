class ServicesController < ApplicationController

   # Mostrar información de la BBDD es formato JSON
   def getalljson
    @services = Service.all()
    render json: @services
  end

  def getall
    @services = Service.all()
  end

  def getter
    @services = params[:id]
    @services = Service.where(id: @services)
  end

  def creator
    @services = Service.new
  end

  def insertService
 
    # Subimos el Archivo al servidor
    
  	
  	@services = Service.new(parametros)
 
  	# Insertamos un registro en la base de datos
    if @services.save
      
  		
  	else
  		render :new
  	end
 
    # Redireccionamos a la vista principal con mensaje 
    @ini = "/services/getall"
    flash[:notice] = "Creado Correctamente !"
    redirect_to @ini 
 
  end

  def updator
    # Pasamos el 'id' del registro a actualizar (método index)   
    @services = Service.find(params[:id])
    @services = Service.where(id: @services)
  end

   # Procesamos la eliminación de un registro de la base de datos
   def remove
    
    # Eliminamos un determinado registro en la base de datos, pasamos el 'id' del registro a eliminar
    @services = Service.find(params[:id])
 
    # Eliminamos la urln perteneciente al registro 
    simg = Service.where(:id => @services).pluck(:url)    
    
 
    Service.where(id: @services ).destroy_all    
    
    # Redireccionamos a la vista principal con mensaje 
    @ini = "/services/getall"
    flash[:notice] = "Eliminado Correctamente !"
    redirect_to @ini 
 
  end

      # Procesamos la actualización de un registro en la base de datos 
  def trueupdate
 
    # Pasamos el 'id' del registro a actualizar (método editar)    
    @services = Service.find(params[:id])    
 
    # Actualizamos el Archivo al servidor
    uploaded_file = params[:image]
 
    if params[:image].present?
 
      # Eliminamos el archivo (imagen) anterior 
      simg = Service.where(:id => @services).pluck(:image)    
      imgeliminar = Rails.root.join('public', 'assets/images', simg.join)
      File.delete(Rails.root + imgeliminar)
 
      # Subimos el nuevo archivo (imagen) 
      File.open(Rails.root.join('public', 'assets/images', uploaded_file.original_filename), 'wb') do |file|
          file.write(uploaded_file.read)
      end
 
    else
      #
    end  
    
    # Actualizamos un determinado registro en la base de datos
    if @services.update(parametros)
      
      # Actualizamos la columna 'img' de la base de datos
      if params[:image].present?
        @services.update_column(:image, uploaded_file.original_filename)
      else
        #
      end          
 
    else
      render :edit
    end
 
      # Redireccionamos a la vista principal con mensaje 
      @ini = "/services/getall"
      flash[:notice] = "Actualizado Correctamente !"
      redirect_to @ini 
 
  end
 
  # Parámetros o campos que insertamos o actualizamos en la base de datos 
  private
  def parametros
  	params.permit(:url, :title, :subtitle, :description)
  end



end
