class SessionsController < ApplicationController

	def create
    @pj = Personaje.find(params[:personaje])
    if @pj
      session[:personaje_id] = @pj.id
      flash[:notice] = "Hola #{@pj.nombre}, ¡a la aventura! "
      redirect_to cual_etapa_path(personaje: @pj.id)
    else
      flash.now[:alert] = "Hubo algún problema al cargar la campaña"
      redirect_to root_path
    end
	end

  def destroy
    session[:personaje_id] = nil
    flash[:notice] = "Has deslogeado el personaje correctamente"
    redirect_to root_path
  end

  
end
