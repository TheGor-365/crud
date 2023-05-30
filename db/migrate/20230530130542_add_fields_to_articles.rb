class AddFieldsToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :published, :boolean
    add_column :articles, :edited_at, :datetime
  end
end
