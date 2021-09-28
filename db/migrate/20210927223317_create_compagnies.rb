class CreateCompagnies < ActiveRecord::Migration[6.0]
  def change
    create_table :compagnies do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :facebook
      t.string :linkedin
      t.string :twitter
      t.integer :country_id
      t.integer :state_id
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
