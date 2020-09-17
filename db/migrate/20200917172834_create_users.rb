class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :univ_name
      t.string :sns_link

      t.timestamps
    end
  end
end
