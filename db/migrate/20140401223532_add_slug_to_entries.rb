class AddSlugToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :slug, :string
    remove_column :entries, :markdown
  end
end
