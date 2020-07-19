class FixColumnNameInEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :adress, :address
  end
end
