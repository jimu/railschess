class Player < ApplicationRecord

  STATUS_ERROR  = 0
  STATUS_READY  = 1
  STATUS_DONE   = 2
  STATUS_INVITE = 3

  belongs_to :game
  belongs_to :user
  has_many :pieces, dependent: :destroy
  has_many :moves, dependent: :destroy

  validates :status, inclusion: { in: [STATUS_READY, STATUS_DONE, STATUS_INVITE], message: 'not selected' }

  STATUS_TEXT = %w{ INVALID Ready Done Invite }

  def status_text
    return STATUS_TEXT[status]
  end

  def self.status_text(status)
    return STATUS_TEXT[status]
  end
end
