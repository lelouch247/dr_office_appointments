class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :gender
      t.string :race
      t.string :insurance

      t.timestamps
    end
  end
end
