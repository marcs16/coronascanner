class CreateTemperatures < ActiveRecord::Migration[5.2]
  def change
    create_table :temperatures do |t|
      t.string :checked_by
      t.string :full_name
      t.datetime :checked_at
      t.string :address
      t.string :phone
      t.string :temperature
      t.string :status

      t.timestamps
    end
  end
end
