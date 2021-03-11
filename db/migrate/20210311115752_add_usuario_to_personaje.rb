class AddUsuarioToPersonaje < ActiveRecord::Migration[6.1]
  def change
    def change
      add_column :personajes, :usuario_id, :int
    end
  end
end
