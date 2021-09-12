class Player < ApplicationRecord

  STATUS_ERROR = 0
  STATUS_READY = 1
  STATUS_DONE  = 2

  belongs_to :game
  belongs_to :user
  has_many :pieces, dependent: :destroy
  has_many :moves, dependent: :destroy

  validates :status, inclusion: { in: [STATUS_READY, STATUS_DONE], message: 'not selected' }

  STATUS_TEXT = %w{ INVALID Ready Done }

  def status_text
    return STATUS_TEXT[status]
  end

end
