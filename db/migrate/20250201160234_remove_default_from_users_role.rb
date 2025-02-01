class RemoveDefaultFromUsersRole < ActiveRecord::Migration[8.0]
  def change
    change_column_default :users, :role, nil 
  end
end
