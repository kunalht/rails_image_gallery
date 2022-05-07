class CreateGalleryTags < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_tags do |t|
      t.references :gallery, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
