class EventsController < ApplicationController
  before_action :set_events, only: [:index]
  before_action :set_event, only: [:show]

  def index
  end

  def show
  end

  def new
  end

  def create
    @event = Event.find(params[:id])
  end

  def edit
    Event.find(params[:id])
  end

  def update
    redirect_to event_path if @event.update(event_params)
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  private

  def set_events
    @events = Event.all
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
