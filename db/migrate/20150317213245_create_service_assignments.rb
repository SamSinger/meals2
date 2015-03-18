class CreateServiceAssignments < ActiveRecord::Migration

  def change
    create_table :service_assignments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :service, index: true
      t.datetime :assignment_date
      t.timestamps null: false
    end
  end
  
end
