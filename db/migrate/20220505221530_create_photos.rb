class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :name, null: false
      t.date :shooting_date
      t.string :description
      t.references :gallery, null: false, foreign_key: true

      t.timestamps
    end
  end
end
