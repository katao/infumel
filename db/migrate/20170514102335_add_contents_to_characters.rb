class AddContentsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :contents, :integer, after: :id
    add_column :characters, :constellation, :string, after: :hip
    add_column :characters, :handedness, :string, after: :constellation
  end
end
