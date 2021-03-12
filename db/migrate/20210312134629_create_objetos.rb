class CreateObjetos < ActiveRecord::Migration[6.1]
  def change
    create_table :objetos do |t|
      t.string :nombre
      t.boolean :usable
      t.boolean :equipable
      t.integer :valor
      t.timestamps
    end
  end
end
