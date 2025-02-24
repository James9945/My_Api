class CreateWildAnimals < ActiveRecord::Migration[8.0]
  def change
    create_table :wild_animals do |t|
      t.string :name
      t.string :scientific_name
      t.string :classification
      t.string :habitat
      t.string :diet
      t.string :conservation_status
      t.string :region

      t.timestamps
    end
  end
end
