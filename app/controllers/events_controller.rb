class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build
    @event.tittle = params[:event][:tittle]
    @event.description = params[:event][:description]
    @event.date = params[:event][:date]
    @event.location = params[:event][:location]

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
    p @event.attendees
  end

  def index
    @created_events = Event.all
  end
end
