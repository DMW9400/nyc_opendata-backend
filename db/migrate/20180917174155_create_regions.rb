class CreateRegions < ActiveRecord::Migration[5.1]
  def change
    create_table :regions do |t|
      t.string :name
      t.integer :uhf_code
      t.string :geoJSON

      t.timestamps
    end
  end
end
