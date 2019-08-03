class CreateYes < ActiveRecord::Migration[5.0]
  def change
    create_table :yes do |t|
      t.string :content
      t.references :condition, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
