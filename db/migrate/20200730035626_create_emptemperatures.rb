class CreateEmptemperatures < ActiveRecord::Migration[5.2]
  def change
    create_table :emptemperatures do |t|
      t.string :done_by
      t.datetime :day_and_time
      t.string :full_name
      t.string :phone
      t.string :adress
      t.string :temperature
      t.string :symptoms

      t.timestamps
    end
  end
end
