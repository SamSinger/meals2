class Services < ActiveRecord::Migration

  def change
    create table :services do |t|
      t.string :prepare_serve_breakfast
      t.string :provide_fellowship_breakfast
      t.string :prepare_serve_lunch
      t.string :provide_fellowship_lunch
      t.timestamps null: false
    end
  end
  
end
