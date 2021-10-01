class CreateAcademics < ActiveRecord::Migration[6.0]
  def change
    create_table :academics do |t|
      t.string :name
      t.text :description
      t.date :obtention_year
      t.string :school
      t.references :profil, null: false, foreign_key: true

      t.timestamps
    end
  end
end
