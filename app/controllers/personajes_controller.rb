class PersonajesController < ApplicationController
	def new
    @personaje = Personaje.new
	end

  def create
    if current_usuario.personajes.count < 6
      @personaje = Personaje.new(personaje_params)
      @personaje.usuario = current_usuario
      @personaje.nivel = 1
      @personaje.exp = 0
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
  end

end
private
def personaje_params
  params.require(:personaje).permit(:nombre, :clase, :nivel, :exp, :mana_max, :mana_actual, :hp_max, :hp_actual, :daño_min, :daño_max, :arma)
end