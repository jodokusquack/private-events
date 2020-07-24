class User < ApplicationRecord
  validates :name, :email, :address, presence: true
  validates :email, uniqueness: true

  has_many :events, foreign_key: "host_id"

  # foreign_key to find myself in the other table
  has_many :invitations, foreign_key: :attendee_id

  # we need a source here to say the key to look for in the "invitations"
  # table is not "event_id" but "attended_event_id"
  has_many :attended_events, through: :invitations, class_name: "Event", source: :event


  def previous_events
    attended_events.where("date < :current_date", current_date: Date.today).order(date: :desc)
  end

  def upcoming_events
    attended_events.where("date >= :current_date", current_date: Date.today).order(date: :asc)
  end
end
