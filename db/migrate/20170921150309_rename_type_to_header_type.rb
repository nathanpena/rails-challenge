class RenameTypeToHeaderType < ActiveRecord::Migration
  def change
    rename_column :site_headings, :type, :header_type
  end
end
