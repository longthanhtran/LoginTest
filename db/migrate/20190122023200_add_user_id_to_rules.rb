class AddUserIdToRules < ActiveRecord::Migration[5.2]
  def change
    add_column :rules, :user_id, :decimal, precision: 5, scale: 2
  end
end
