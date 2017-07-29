class CreateAnimals < ActiveRecord::Migration[5.1]
  def change
    create_table :animals do |t|
      t.string :sci_name
      t.string :kingdom
      t.string :classification
      t.string :family
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
