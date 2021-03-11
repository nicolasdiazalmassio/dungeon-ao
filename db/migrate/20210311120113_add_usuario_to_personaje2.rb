class AddUsuarioToPersonaje2 < ActiveRecord::Migration[6.1]
  def change
    add_column :personajes, :usuario_id, :int
  end
end
