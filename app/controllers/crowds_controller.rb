class CrowdsController < ApplicationController
  before_action :set_event, only: [:new, :create]
  before_action :set_crowd, only: [:update, :destroy]

  def new
    @crowd = Crowd.new
    authorize @crowd
  end

  def create
    @crowd = Crowd.new(event: @event, size: params[:crowd][:size])
    authorize @crowd
    if @crowd.save
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def update
    authorize @crowd
    if @crowd.update(crowd_edit_params)
      redirect_to dashboard_path
    else
      render events_path
    end
  end

  def destroy
    authorize @crowd
    @event = @crowd.event
    @crowd.destroy
    redirect_to event_path(@event)
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_crowd
    @crowd = Crowd.find(params[:id])
  end

  def crowd_edit_params
    params.require(:crowd).permit(:event_id)
  end
end
