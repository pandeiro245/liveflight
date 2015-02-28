class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :url
      t.text :img_src
      t.string :address
      t.text :description
      t.timestamps null: false
    end
  end
end
