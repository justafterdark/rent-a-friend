class EventsController < ApplicationController
  before_action :set_events, only: [:index]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  # form only
  def new
    @event = Event.new
    @categories = ["wedding", "birthday", "social"]
  end

  # create is the action involved in creation
  def create
    # pass strong params into Event.new
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def edit
   @categories = ["wedding", "birthday", "social"]
   # get event type
   @type = @event.event_type
  end

  def update
    redirect_to event_path if @event.update(event_params)
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  # add strong event params
  def event_params
    params.require(:event).permit(:datetime, :event_type, :description, :event_location, :meeting_location, :confirmed)
  end

  def set_events
    @events = Event.all
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
