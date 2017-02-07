class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, :only => [ :show, :edit, :update, :destroy]
  def index
    @events = Event.page(params[:page]).per(5)
  end

  def new
    @event =Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save

    redirect_to :action => :index
  end

  def show
  end

  def edit
  end

  def update
    @event.update(event_params)

    redirect_to :action => :show, :id => @event
  end

  def destroy
    @event.destroy

    redirect_to :action => :index
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :category_id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
