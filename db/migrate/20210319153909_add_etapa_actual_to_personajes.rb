class AddEtapaActualToPersonajes < ActiveRecord::Migration[6.1]
  def change
    add_column :personajes, :oro, :int
    add_column :personajes, :etapa_actual, :int
  end
end
