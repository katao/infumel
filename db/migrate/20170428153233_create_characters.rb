class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table(:characters) do |t|
      t.integer :game_id
      t.string :l_name
      t.string :f_name
      t.string :l_kana
      t.string :f_kana
      t.string :roma
      t.string :search_word
      t.integer :cv_id
      t.integer :idol_type
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :birthday
      t.string :blood_type
      t.integer :bust
      t.integer :waist
      t.integer :hip
      t.string :color
      t.text :description
      t.text :memo
      t.integer :position

      t.timestamps
    end
  end
end
