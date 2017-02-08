class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_event, :only => [ :edit, :update, :destroy]
  def index
    @events = Event.all.page(params[:page]).per(5)
    #if params[:event_id]
     # unless @event = current_user.events.find_by_id(params[:event_id])
      #  flash[:alert] = "It's not your Event!"
       # redirect_to events_path(page: params[:page])
      #end
    #else
     # @event = Event.new
    #end
  end

  def new
    @event =Event.new
  end

  def create
    #@event = Event.new(event_params)
    #byebug
    @event = current_user.events.new(event_params)
    #byebug
    if @event.save
      redirect_to events_path
    else
      render new_event_path(@event)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
  end

  def update
    @event.update(event_params)

    #redirect_to :action => :show, :id => @event
    redirect_to event_path(@event)
  end

  def destroy

    @event.destroy
    redirect_to events_path

  end



  private

  def event_params
    params.require(:event).permit(:title, :content, :category_id)
  end

  def set_event
    @event = Event.find(params[:id])
    if !(@event.user == current_user)
      flash[:alert] = "無權限操作！"
      redirect_to events_path
    end
  end

end
