class PersonajesController < ApplicationController
  before_action :set_personaje, only:[:combate, :ataque]
  before_action :set_npc, only:[:combate, :ataque]
  
	def new
    @personaje = Personaje.new
	end

  def create
    if current_usuario.personajes.count < 6
      @personaje = Personaje.new(personaje_params)
      @personaje.usuario = current_usuario
      @personaje.nivel = 1
      @personaje.exp = 0
      @personaje.etapa_actual = 1
      @personaje.oro = 0
      if @personaje.clase == "Guerrero"
        @personaje.hp_actual = 30
        @personaje.hp_max = 30
        @personaje.mana_actual = 0
        @personaje.mana_max = 0
        @personaje.daño_min = 3
        @personaje.daño_max = 5
      end
      if @personaje.clase == "Mago"
        @personaje.hp_actual = 20
        @personaje.hp_max = 20
        @personaje.mana_actual = 10
        @personaje.mana_max = 10
        @personaje.daño_min = 1
        @personaje.daño_max = 2
      end
      if @personaje.save
        flash[:notice] = "Su personaje ha sido creado correctamente."
        redirect_to root_path
      else
        render 'new'
      end
    end
  end

  def index
    @personajes = current_usuario.personajes
  end

  def show
    @personaje = Personaje.find(params[:id])
    @hp = porcentajehp(@personaje)
    @mp = porcentajemp
  end

  def combate
    @hp = porcentajehp(@personaje)
    @mp = porcentajemp
    @hp_npc = porcentajehp(@npc)
    
  end

  def ataque

    daño_pj = rand @personaje.daño_min..@personaje.daño_max
    daño_npc = rand @npc.daño_min..@npc.daño_max
    hp_npc = @npc.hp_actual
    hp_pj = @personaje.hp_actual
    daño_realizado = 0
    daño_recibido = 0

      while hp_npc  > 0 && hp_pj > 0
        hp_npc = hp_npc - daño_pj
        daño_realizado = daño_realizado + daño_pj
        if hp_npc > 0
          hp_pj = hp_pj - daño_npc
          daño_recibido = daño_recibido + daño_npc
        end
      end
      
      if hp_npc <=  0
        flash[:notice] = "Has recibido #{daño_recibido} puntos de daño de la criatura y has realizado #{daño_realizado} puntos de daño.
        ¡Enhorabuena! Has derrotado a #{@npc.nombre} "
        @personaje.update_attribute(:hp_actual, hp_pj)
        @personaje.etapa_actual = @personaje.etapa_actual + 1
        @personaje.save
        redirect_to cual_etapa_path(personaje: @personaje.id)
      else
        flash[:alert] = "Has sido derrotado por #{@npc.nombre} "
        redirect_to cual_etapa_path(personaje: @personaje.id)
      end

  end

end



private
def personaje_params
  params.require(:personaje).permit(:nombre, :clase, :nivel, :exp, :mana_max, :mana_actual, :hp_max, :hp_actual, :daño_min, :daño_max, :arma)
end

def porcentajehp(obj)
  hp = (obj.hp_actual/obj.hp_max)*100
end

def porcentajemp
  if @personaje.mana_actual == 0 || @personaje.mana_max == 0
    mp = 0
  else
  mp = (@personaje.mana_actual/@personaje.mana_max)*100
  end
end

def set_personaje
  @personaje = Personaje.find_by_id(params[:personaje])
end

def set_npc
  @npc = Npc.find_by_id(params[:npc])
end