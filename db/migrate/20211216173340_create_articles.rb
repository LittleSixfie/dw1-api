class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :image
      t.string :title
      t.string :subtitle
      t.string :tags
      t.string :preview
      t.string :text

      t.timestamps
    end
  end
end
