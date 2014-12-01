class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :namee
      t.string :email
      t.string :altemail

      t.timestamps
    end
  end
end
