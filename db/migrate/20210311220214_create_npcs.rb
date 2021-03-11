class CreateNpcs < ActiveRecord::Migration[6.1]
  def change
    create_table :npcs do |t|
      t.string :nombre
      t.integer :hp_max
      t.integer :hp_actual
      t.integer :evasion
      t.integer :daño_min
      t.integer :daño_max
      t.timestamps
    end
  end
end
