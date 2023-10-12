class AddColumnToDevelopers < ActiveRecord::Migration[7.0]
  def change
    add_column :developers, :availability, :boolean
  end
end
