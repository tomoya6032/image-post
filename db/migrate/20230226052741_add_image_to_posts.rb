class AddImageToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :image, :string unless column_exists?(:posts, :image)
  end
end
