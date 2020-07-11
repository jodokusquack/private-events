class AddHostToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :host, foreign_key: {to_table: :users}
  end
end
