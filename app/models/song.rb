# frozen_string_literal: true

class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: %i[artist_name release_year],
    message: "Artist cannot release the same song more than once per year",
  }
  validates :released, inclusion: { in: [true, false] }
  with_options if: :released? do |song|
    song.validates :release_year, presence: true
    song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year,
    }
  end
  validates :artist_name, presence: true

  def released?
    released
  end
end
