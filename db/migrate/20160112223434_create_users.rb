class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :username

      t.timestamps null: false
    end
  end
end
