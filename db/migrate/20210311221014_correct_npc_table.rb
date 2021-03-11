class CorrectNpcTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :npcs, :evasion
    add_column :npcs, :evasion, :decimal
  end
end
