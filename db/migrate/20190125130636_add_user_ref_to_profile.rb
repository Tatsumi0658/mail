class AddUserRefToProfile < ActiveRecord::Migration[5.2]
  def change
    add_reference :profile, :user, foreign_key: true
  end
end
