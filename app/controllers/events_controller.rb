class EventsController < ApplicationController
  before_action :authenticate_user, except: [:show, :index]

  def index
    @events = Event.all.order(date: :desc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    if @event.save
      flash[:success] = "You successfully created an Event!"
      redirect_to @event
    else
      flash[:alert] = "An error occurred. Please try again."
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :address, :date)
  end
end
