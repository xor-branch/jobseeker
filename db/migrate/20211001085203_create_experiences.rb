class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.references :profil, null: false, foreign_key: true

      t.timestamps
    end
  end
end
