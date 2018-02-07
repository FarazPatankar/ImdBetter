class CreateActors < ActiveRecord::Migration[5.1]
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :gender
      t.date :dob
      t.string :photo_url

      t.timestamps
    end
  end
end
