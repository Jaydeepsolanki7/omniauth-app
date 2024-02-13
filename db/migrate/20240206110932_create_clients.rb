class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :email
      t.string :uid, null: false

      t.timestamps
    end
  end
end
