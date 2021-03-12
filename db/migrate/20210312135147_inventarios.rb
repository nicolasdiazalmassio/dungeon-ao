class Inventarios < ActiveRecord::Migration[6.1]
  def change
    create_table :inventarios do |t|
      t.integer :personaje_id
      t.integer :objeto_id
      t.integer :cantidad
    end
  end
end
