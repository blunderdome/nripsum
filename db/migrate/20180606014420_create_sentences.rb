class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
