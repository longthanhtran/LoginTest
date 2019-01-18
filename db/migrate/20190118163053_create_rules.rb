class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :cidr
      t.integer :permission

      t.timestamps
    end
  end
end
