# frozen_string_literal: true

class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true
  validates :release_year, presence: true, unless: :not_released?
  validate :not_future

private

  def not_future
  unless release_year.nil?
    errors.add(:release_year, "should not be a future date") unless Date.new(2018, 0o7, 24).year >= release_year
    end
  end

  def not_released?
    released == false
  end
end
