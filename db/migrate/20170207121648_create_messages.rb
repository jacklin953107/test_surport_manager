class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :name
      t.integer :event_id

      t.timestamps
    end
  end
end
