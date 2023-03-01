class AddImageToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :picture, :string unless column_exists?(:posts, :pictures)
  end
end
