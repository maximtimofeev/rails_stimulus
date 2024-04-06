class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :url
      t.integer :reading_time

      t.boolean :published, default: false

      t.string :seo_title
      t.string :seo_description

      t.timestamps
    end
  end
end
