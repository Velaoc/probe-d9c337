class CreateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :messages do |t|
      t.string :author_name, null: false, default: ""
      t.text :body, null: false
      t.timestamps
    end
    add_index :messages, :created_at
  end
end
