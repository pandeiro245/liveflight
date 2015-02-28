class Youtube < ActiveRecord::Migration
  def change
    add_column :places, :youtube, :string
  end

  def down
    remove_column :places, :youtube, :string
  end
end
