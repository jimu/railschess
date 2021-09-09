class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :pieces, dependent: :destroy
  has_many :moves, dependent: :destroy

  STATUS_INVALID = 0
  STATUS_OPEN    = 1
  STATUS_CLOSED  = 2
  STATUS_PLAY    = 3
  STATUS_DONE    = 4
  STATUS_ARCHIVE = 5
  STATUS_MAX     = 5

  validates_inclusion_of :status, :in => 1..STATUS_MAX

  STATUS_DESCRIPTION = %w{ INVALID Open Closed Playing Completed Archived }

  def status_description
    return STATUS_DESCRIPTION[status]
  end
end
