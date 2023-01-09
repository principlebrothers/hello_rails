# Purpose: Add a reference to the user table to the greetings table
class AddReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :greetings, :user, foreign_key: true
  end
end
