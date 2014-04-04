class AddExcerptToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :excerpt, :text
  end
end
