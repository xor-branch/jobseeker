class CreatePersonals < ActiveRecord::Migration[6.0]
  def change
    create_table :personals do |t|
      t.integer :gender
      t.integer :marital_statut
      t.integer :children
      t.date :birth_day
      t.string :language
      t.references :profil, null: false, foreign_key: true

      t.timestamps
    end
  end
end
