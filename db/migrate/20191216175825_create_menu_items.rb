class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.boolean :beverage
      t.string :item_cat
      t.references :provider, null: false, foreign_key: true
      t.string :img_url
      t.text :description
      t.boolean :vegan
      t.boolean :vegetarian

      t.timestamps
    end
  end
end
