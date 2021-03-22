class CampaniasController < ApplicationController
  before_action :set_personaje
  before_action :requiere_personaje
  before_action :requiere_mismo_personaje
  
  def etapa1
  end
  def etapa2
  end
  def etapa3

  end


  def cual_etapa
    case @personaje.etapa_actual
    when 1 
      redirect_to etapa1_path(personaje: @personaje.id)
    when 2 
      redirect_to etapa2_path(personaje: @personaje.id)
    when 3 
      redirect_to etapa3_path(personaje: @personaje.id)
    when 4 
      redirect_to etapa4_path(personaje: @personaje.id)
    when 5 
      redirect_to etapa5_path(personaje: @personaje.id)
    when 6 
      redirect_to etapa6_path(personaje: @personaje.id)
    else
      redirect_to root_path
    end
  end
end 


private

def set_personaje
  @personaje = Personaje.find_by_id(params[:personaje])
  if !@personaje
    flash[:alert] = "El personaje no existe"
    redirect_to root_path
  end
end

def requiere_mismo_personaje
  if @personaje
    if personaje_actual.id != @personaje.id
      flash[:alert] = "Solo puedes jugar con el personaje que iniciaste sesion"
      redirect_to personajes_path
    end
  else
    flash[:alert] = "El personaje no existe"
    redirect_to root_path
  end
end
