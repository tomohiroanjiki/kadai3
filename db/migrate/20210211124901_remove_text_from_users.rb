class RemoveTextFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :image, :text
  end
end
