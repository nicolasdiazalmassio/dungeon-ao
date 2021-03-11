class CorrectPersonajeTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :personajes, :evasion
    add_column :personajes, :evasion, :decimal
  end
end
