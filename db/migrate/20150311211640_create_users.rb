class CreateUsers < ActiveRecord::Migration
  
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.string :role
      t.string :organization_name
      t.timestamps
    end
  end

end
