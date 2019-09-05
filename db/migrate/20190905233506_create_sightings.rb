class CreateSightings < ActiveRecord::Migration[5.2]
  def change
    create_table :sightings do |t|
      t.references :animal, foreign_key: true
      t.datetime :date
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
