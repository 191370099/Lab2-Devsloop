class AddDetailsToTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :project, foreign_key: true
    add_reference :tasks, :developer, foreign_key: true
  end
end
