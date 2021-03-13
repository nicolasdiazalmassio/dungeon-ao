class InventariosController < ApplicationController
  def new
  end

  def create

      if Inventario.where(personaje_id: params[:personaje], objeto_id: params[:objeto_id]).first == nil
        @nuevoitem = Inventario.new(personaje_id: params[:personaje], objeto_id: params[:objeto_id], cantidad: 1)
        @nuevoitem.save
        @existe_item = true
      end
    
    redirect_to params[:redirect]

  end
end 
