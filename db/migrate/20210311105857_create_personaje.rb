class CreatePersonaje < ActiveRecord::Migration[6.1]
  def change
    create_table :personajes do |t|
      t.integer :nivel
      t.integer :exp
      t.string :nombre
      t.string :clase
      t.integer :mana_max
      t.integer :mana_actual
      t.integer :hp_max
      t.integer :hp_actual
      t.integer :evasion
      t.integer :daño_min
      t.integer :daño_max
      t.boolean :arma, :default => false
      t.timestamps
    end
  end
end
