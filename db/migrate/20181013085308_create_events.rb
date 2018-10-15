class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.string :category
      t.string :sub_category
      t.string :mood
      t.integer :longtitude
      t.integer :latitude
      t.date :date
      t.time :time
      t.integer :cost
      t.string :participants, array: true, default: []
      t.boolean :status, default: "Active"
      t.string :event_type, default: "Public"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
