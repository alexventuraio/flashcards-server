class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login
      t.string :name
      t.string :avatar_url

      t.timestamps
    end

    add_index :users, :login, unique: true
  end
end
