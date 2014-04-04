class AddMarkdownToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :markdown, :text
  end
end
