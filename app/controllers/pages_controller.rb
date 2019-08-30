class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def dashboard
    # authorize current_user
    @events = current_user.events
    @mobfriend = current_user.mobfriend
    @jobs = current_user.mobfriend.jobs if current_user.mobfriend.present?
    @pending_events = pending_events
    @confirmed_events = confirmed_events
  end

  def your_events
    # authorize current_user
    @job = Job.new
    @mobfriend = Mobfriend.find(params[:mobfriend_id])
    @events = current_user.events
    @pending_events = pending_events
  end

  private

  def pending_events
    current_user.events.select do |event|
      event.confirmed == false
    end
  end

  def confirmed_events
    current_user.events.select do |event|
      event.confirmed
    end
  end
end
