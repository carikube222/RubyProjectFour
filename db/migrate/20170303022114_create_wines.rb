class CreateWines < ActiveRecord::Migration[5.0]
  def change
    create_table :wines do |t|
      t.string :url
      t.string :name
      t.string :title
      t.string :location

      t.timestamps
    end
  end
end
