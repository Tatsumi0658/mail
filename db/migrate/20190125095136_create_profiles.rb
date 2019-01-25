class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :username
      t.text :introduce
      t.text :image

      t.timestamps
    end
  end
end
