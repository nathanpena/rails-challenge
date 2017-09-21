class CreateSiteHeadings < ActiveRecord::Migration
  def change
    create_table :site_headings do |t|
      t.string :content
      t.string :type
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
