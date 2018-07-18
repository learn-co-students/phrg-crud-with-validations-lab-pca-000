# frozen_string_literal:true

class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :song_release
  validates :title, uniqueness: true

  def song_release
    return unless released && (!release_year || release_year >= Date.today.year)
    errors.add(:base, "Not valid")
  end
end
