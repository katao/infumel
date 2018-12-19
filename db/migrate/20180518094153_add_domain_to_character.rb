class AddDomainToCharacter < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :domain, :string, after: :memo
  end
end
