class CreateItems < ActiveRecord::Migration[6.0]
  def change

    create_table :users do |t|
      t.timestamps null: false
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false
    end

    add_index :users, :email
    add_index :users, :remember_token

    create_table :channels do |t|
      t.string :name
      t.text :description
      t.string :object_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    create_table :items do |t|
      t.string :name
      t.string :url
      t.integer :votes_count
      t.references :channel, null: false, foreign_key: true

      t.timestamps
    end

    create_table :votes do |t|
      t.string :comment
      t.boolean :new_item

      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

  end
end
