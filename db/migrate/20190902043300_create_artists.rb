class CreateArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.integer :age
      t.string :DOB
      t.string :birth_place

      t.timestamps
    end
  end
end
