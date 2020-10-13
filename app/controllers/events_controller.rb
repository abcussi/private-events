class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(events_params)
    if @event.save
      flash[:message] = 'New event created'
      redirect_to event_path(@event)

    else
      flash.now[:message] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @event.attendees = User.all
  end

  def index
    @created_events = Event.all
    @past_events = Event.past
    @upcoming = Event.upcoming
  end

  def events_params
    params.require(:event).permit(:tittle, :description, :date, :location)
  end
end
