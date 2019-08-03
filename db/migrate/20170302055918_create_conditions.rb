class CreateConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.string :object
      t.date :startdate
      t.date :enddate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
