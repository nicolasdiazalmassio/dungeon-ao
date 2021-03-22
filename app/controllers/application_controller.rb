class ApplicationController < ActionController::Base
  before_action :authenticate_usuario!

  helper_method :personaje_actual, :logeado?

  def personaje_actual
    @personaje_actual ||= Personaje.find(session[:personaje_id]) if session[:personaje_id]
  end

  def logeado?
    !!personaje_actual
  end
  
  def requiere_personaje
    if !logeado?
      flash[:alert] = "Primero debes entrar en campaña con algún personaje"
      redirect_to root_path
    end
  end

end
