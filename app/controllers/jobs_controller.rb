class JobsController < ApplicationController
  def create
    @event = Event.find(params[:job][:event])
    @mobfriend = Mobfriend.find(params[:mobfriend_id])
    @job = Job.new(mobfriend: @mobfriend, event: @event)
    authorize @job
    if @job.save
      redirect_to event_path(@event)
    else
      render mobfriend_path(@mobfriend)
    end
  end

  def destroy
    @job = Job.find(params[:id])
    authorize @job
    @job.destroy
    redirect_to event_path(current_user.events.first)
  end
end
