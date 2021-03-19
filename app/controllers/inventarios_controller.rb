class InventariosController < ApplicationController
  before_action :set_objeto, only: [:usar]
  before_action :set_personaje, only: [:usar]
  def new
  end

  def create
    if Inventario.where(personaje_id: params[:personaje], objeto_id: params[:objeto_id]).first == nil
      @nuevoitem = Inventario.new(personaje_id: params[:personaje], objeto_id: params[:objeto_id], cantidad: 1)
      @nuevoitem.save
      @existe_item = true
    end
    redirect_to cual_etapa_path(personaje: @personaje.id)
  end

  def usar
    if @objeto.cantidad > 1
      @objeto.cantidad = @objeto.cantidad - 1
      @objeto.save
    else
      @objeto.destroy
    end
    efecto_objeto(@objeto, @personaje)
    @personaje.save
    redirect_back(fallback_location: root_path)

  end

end 

private

  def set_objeto
    @objeto = Inventario.where(personaje_id: params[:personaje], objeto_id: params[:objeto]).first
  end

  def set_personaje
    @personaje = Personaje.find(params[:personaje])
  end

  def efecto_objeto(obj, pj)
    if obj.objeto_id == 1 #"Pocion roja"
      pj.hp_actual = pj.hp_actual + 15
      if pj.hp_actual > pj.hp_max
        pj.hp_actual = pj.hp_max
      end
    end
    if obj.objeto_id == 2 #"Pocion azul"
      if pj.mana_max != 0
        pj.mana_actual = pj.mana_actual + 10
        if pj.mana_actual > pj.mana_max
          pj.mana_actual = pj.mana_max
        end
      end
    end
  end
