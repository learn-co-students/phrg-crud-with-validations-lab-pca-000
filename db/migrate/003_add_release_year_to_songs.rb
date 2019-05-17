# frozen_string_literal: true

class AddReleaseYearToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :release_year, :integer
  end
end
