class AddOpinionToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :opinion, :integer
  end
end
