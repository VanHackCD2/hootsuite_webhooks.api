class AddUrlToHooks < ActiveRecord::Migration[5.0]
  def change
    add_column :hooks, :url, :string
  end
end
