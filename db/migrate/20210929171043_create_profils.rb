class CreateProfils < ActiveRecord::Migration[6.0]
  def change
    create_table :profils do |t|
      t.string :name
      t.string :speciality
      t.text :bio
      t.integer :telephone
      t.integer :country_id
      t.integer :state_id
      t.boolean :asc_certificat
      t.boolean :terms_use
      t.string :facebook
      t.string :twitter
      t.string :linkedin
      t.string :github

      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
