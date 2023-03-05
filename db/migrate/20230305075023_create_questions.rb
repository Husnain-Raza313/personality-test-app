class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :content, null: false, default: '', unique: true

      t.timestamps
    end
  end
end
