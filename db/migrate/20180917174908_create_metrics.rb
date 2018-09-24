class CreateMetrics < ActiveRecord::Migration[5.1]
  def change
    create_table :metrics do |t|
      t.string :name
      t.string :measure
      t.string :data_value
      t.string :year
      t.integer :region_code
      t.integer :region_id

      t.timestamps
    end
  end
end
