class CampaniasController < ApplicationController
  before_action :set_personaje
  
  def etapa1
    
  end
  
  def etapa2
    
  end

end 


private

def set_personaje
  @personaje = Personaje.find(params[:personaje])
end