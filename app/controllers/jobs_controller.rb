class JobsController < ApplicationController
  def create
    @event = current_user.events.first
    @mobfriend = Mobfriend.find(params[:mobfriend_id])
    @job = Job.new(mobfriend: @mobfriend, event: @event)
    if @job.save
      redirect_to event_path(@event)
    else
      render mobfriend_path(@mobfriend)
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to event_path(current_user.events.first)
  end
end