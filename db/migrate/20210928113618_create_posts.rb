class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :category
      t.string :title
      t.text :description
      t.integer :jobtype
      t.date :deadline
      t.integer :min_salary
      t.integer :max_salary
      t.string :frequence
      t.integer :state_id
      t.references :account, null: false, foreign_key: true
      t.boolean :terms_use

      t.timestamps
    end
  end
end
