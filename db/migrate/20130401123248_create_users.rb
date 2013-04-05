class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :email
      t.timestamp :created
      t.boolean :active

      t.timestamps
    end
  end
end
