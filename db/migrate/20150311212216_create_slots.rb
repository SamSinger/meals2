class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.date :slot_date
      t.string :which_meal
      t.boolean :prepare_serve_meal
      t.boolean :provide_fellowship
      t.integer :user_id
      t.timestamps
    end
  end
end
