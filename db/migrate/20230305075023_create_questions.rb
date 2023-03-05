class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :content, null: false, default: '', unique: true

      t.timestamps
    end
  end
end
