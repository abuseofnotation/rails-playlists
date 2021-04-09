class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.string :name
      t.text :description
      t.string :object_type

      t.timestamps
    end
  end
end
