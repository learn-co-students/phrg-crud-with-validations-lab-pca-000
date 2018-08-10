# frozen_string_literal: true

class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true,
                           if: :released?,
                           numericality:
                             {
                               only_integer: true,
                               greater_than_or_equal_to: 1900,
                               less_than_or_equal_to: Date.today.year,
                             }
  validates :title, uniqueness: { scope: %i[release_year title] }

private

  def released?
    released
  end
end
