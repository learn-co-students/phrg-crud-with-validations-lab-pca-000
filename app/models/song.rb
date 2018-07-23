# frozen_string_literal: true

class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :release_year, presence: true, unless: :not_released?
  validate :valid_release_year

private

  def valid_release_year
    return if release_year_is_past_or_current?
    errors.add(:release_year, "should not be a future date")
  end

  def not_released?
    released == false
  end

  def current_year
    Time.zone.today.year
  end

  def release_year_is_past_or_current?
    release_year.blank? || current_year > release_year
  end
end
