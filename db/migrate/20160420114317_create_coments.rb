class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.references :entry, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
