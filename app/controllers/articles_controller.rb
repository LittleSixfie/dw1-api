class ArticlesController < ApplicationController
  @root_url = "/articles/index"
 
  layout 'application'
 
  add_flash_types :notice

  # Mostrar información de la BBDD es formato JSON
  def show
    @articles = Article.all()
    render json: @articles
  end

  # Listar todos los registros de la Base de Datos 
  def index
  	@articles = Article.all()
  end
 
  # Leer los detalles de un registro 
  def leer
    @articles = params[:id]
    @articles = Article.where(id: @articles)
  end
 
  # Llamamos a la vista con el formulario para crear un registro 
  def crear
  	@articles = Article.new
  end
 
  # Procesamos la creación de un registro en la base de datos
  def insertar
 
    # Subimos el Archivo al servidor
    uploaded_file = params[:image]
    File.open(Rails.root.join('public', 'assets/images', uploaded_file.original_filename), 'wb') do |file|
        file.write(uploaded_file.read)
    end
  	
  	@articles = Article.new(parametros)
 
  	# Insertamos un registro en la base de datos
    if @articles.save
      
      @articles.update_column(:image, uploaded_file.original_filename)
  		
  	else
  		render :new
  	end
 
    # Redireccionamos a la vista principal con mensaje 
    @ini = "/articles/index"
    flash[:notice] = "Creado Correctamente !"
    redirect_to @ini 
 
  end
 
  # Llamamos a la vista con el formulario para actualizar un registro 
 
  def actualizar
    # Pasamos el 'id' del registro a actualizar (método index)   
    @articles = Article.find(params[:id])
    @articles = Article.where(id: @articles)
 
  end
 
  # Procesamos la actualización de un registro en la base de datos 
  def editar
 
    # Pasamos el 'id' del registro a actualizar (método editar)    
    @articles = Article.find(params[:id])    
 
    # Actualizamos el Archivo al servidor
    uploaded_file = params[:image]
 
    if params[:image].present?
 
      # Eliminamos el archivo (imagen) anterior 
      simg = Article.where(:id => @articles).pluck(:image)    
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
    if @articles.update(parametros)
      
      # Actualizamos la columna 'img' de la base de datos
      if params[:image].present?
        @articles.update_column(:image, uploaded_file.original_filename)
      else
        #
      end          
 
    else
      render :edit
    end
 
      # Redireccionamos a la vista principal con mensaje 
      @ini = "/articles/index"
      flash[:notice] = "Actualizado Correctamente !"
      redirect_to @ini 
 
  end
 
  # Procesamos la eliminación de un registro de la base de datos
  def eliminar
    
    # Eliminamos un determinado registro en la base de datos, pasamos el 'id' del registro a eliminar
    @articles = Article.find(params[:id])
 
    # Eliminamos la imagen perteneciente al registro 
    simg = Article.where(:id => @articles).pluck(:image)    
    imgeliminar = Rails.root.join('public', 'assets/images', simg.join)
    File.delete(Rails.root + imgeliminar)
 
    Article.where(id: @articles ).destroy_all    
    
    # Redireccionamos a la vista principal con mensaje 
    @ini = "/articles/index"
    flash[:notice] = "Eliminado Correctamente !"
    redirect_to @ini 
 
  end
 
  # Parámetros o campos que insertamos o actualizamos en la base de datos 
  private
  def parametros
  	params.permit(:image, :title, :subtitle, :tags, :preview, :text)
  end

end
