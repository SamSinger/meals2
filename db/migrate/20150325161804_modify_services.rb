class ModifyServices < ActiveRecord::Migration
  def change
    remove_column :services, :prepare_serve_breakfast
    remove_column :services, :provide_fellowship_breakfast
    remove_column :services, :prepare_serve_lunch
    remove_column :services, :provide_fellowship_lunch
  end
end
