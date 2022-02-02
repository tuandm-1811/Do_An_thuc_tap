class CreateAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_to_users do |t|
      add_column :users, :admin, :boolean, default: false
      t.timestamps
    end
  end
end
