class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :provider, null: false, foreign_key: true
      t.datetime :edate
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
