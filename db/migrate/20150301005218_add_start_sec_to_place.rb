class AddStartSecToPlace < ActiveRecord::Migration
  def change
    add_column :places, :start_sec, :integer
  end
end
