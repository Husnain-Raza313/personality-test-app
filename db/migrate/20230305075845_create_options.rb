class CreateOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :options do |t|
      t.text :content, null: false, default: '', unique: true
      t.integer :option_type, null: false, default: 0

      t.references :question, null: false, foreign_key: true
      t.index %i[content question_id], unique: true
      t.timestamps
    end
  end
end
