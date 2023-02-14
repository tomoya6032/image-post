class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.string :kind
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
