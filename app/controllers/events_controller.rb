class EventsController < ApplicationController
  before_action :set_events, only: [:index]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = policy_scope(Event).order(created_at: :desc)
  end

  def show
    authorize @event
    @date = format_datetime(@event.datetime)
  end

  # form only
  def new
    @event = Event.new
    authorize @event
    @categories = ["wedding", "birthday", "social"]
  end

  # create is the action involved in creation
  def create
    # pass strong params into Event.new
    @event = Event.new(event_params)
    authorize @event
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
    authorize @event
    if @event.update(event_params)
      redirect_to event_path
    else
      render 'edit'
    end
  end

  def destroy
    authorize @event
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

  def format_datetime(datetime)
    hour = datetime.hour
    min = datetime.min
    date = datetime.to_date
    suffix = 'AM'
    if hour > 12
      hour -= 12
      suffix = 'PM'
    end
    "#{date}, #{hour}:#{min} #{suffix}"
  end
end
