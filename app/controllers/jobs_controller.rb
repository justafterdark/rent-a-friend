class JobsController < ApplicationController
  def create
    @event = Event.find(params[:job][:event])
    @mobfriend = Mobfriend.find(params[:mobfriend_id])
    @job = Job.new(mobfriend: @mobfriend, event: @event)
    authorize @job
    @job.crowd = @event.crowd if @event.public
    @job.accepted = true if @event.public

    if @job.save
      if @event.public
        redirect_to dashboard_path
      else
        redirect_to event_path(@event)
      end
    else
      render mobfriend_path(@mobfriend)
    end
  end

  def destroy
    @job = Job.find(params[:id])
    authorize @job
    @event = @job.event
    @job.destroy
    redirect_to event_path(@event)
  end
end
