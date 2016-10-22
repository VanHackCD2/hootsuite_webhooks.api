class AddHookRefToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :hook, foreign_key: true
  end
end
