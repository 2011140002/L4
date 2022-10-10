class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :uid
      t.string :pass

      t.timestamps
    end
  end
end
