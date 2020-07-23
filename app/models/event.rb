class Event < ApplicationRecord
  belongs_to :host, class_name: "User"

  # foreign_key is to find yourself
  has_many :invitations
  # source woulde be to find the other model, but in this case, the
    # invitation model has the columns "attendee_id" and "event_id", so
    # according to convention
  has_many :attendees, class_name: "User", through: :invitations
end
