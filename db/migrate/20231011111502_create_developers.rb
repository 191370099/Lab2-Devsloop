class CreateDevelopers < ActiveRecord::Migration[7.0]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :category

      t.timestamps
    end
  end
end
