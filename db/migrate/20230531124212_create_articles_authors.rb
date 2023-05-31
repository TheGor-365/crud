class CreateArticlesAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :articles_authors do |t|
      t.belongs_to :article
      t.belongs_to :author

      t.timestamps
    end
  end
end
