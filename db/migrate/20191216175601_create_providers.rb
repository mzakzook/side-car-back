class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :biz_name
      t.string :tax_id
      t.string :placeholder_image
      t.string :website
      t.string :yelp
      t.string :biz_phone
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
