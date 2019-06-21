# frozen_string_literal: true

class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist_name
      t.string :genre
      t.integer :release_year
      t.boolean :released

      t.timestamps null: false
    end
  end
end
