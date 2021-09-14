class Game < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :pieces, dependent: :destroy
  has_many :moves, dependent: :destroy


  # status constants
  STATUS_INVALID = 0
  STATUS_OPEN    = 1
  STATUS_CLOSED  = 2
  STATUS_PLAY    = 3
  STATUS_DONE    = 4
  STATUS_ARCHIVE = 5
  STATUS_MAX     = 5

  # validations
  validates_inclusion_of :status, :in => 1..STATUS_MAX
  #validate :has_valid_players, if: Proc.new {status == Game::STATUS_CLOSED}
  accepts_nested_attributes_for :players
  validates_associated :players


  STATUS_DESCRIPTION = %w{ INVALID Open Closed Playing Completed Archived }

  def status_description
    STATUS_DESCRIPTION[status]
  end

  def has_valid_players
    if players.count != 2 then
      errors.add :players, :too_plain,
         message: "must include White and Black (has #{players.count} players)"
    end
  end


end


# closed game players options:
#   custom validator https://guides.rubyonrails.org/active_record_validations.html#on
#   would check for special player attribute asserting there is one player W+READY and one player B+DONE
#
#
#   https://guides.rubyonrails.org/v3.2/active_record_validations_callbacks.html#working-with-validation-errors
