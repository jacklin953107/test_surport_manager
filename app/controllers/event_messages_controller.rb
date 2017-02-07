class EventMessagesController < ApplicationController
  before_action :find_event
  before_action :find_message, :only => [:show, :edit, :update, :destroy]

  def index
    @messages = @event.messages
  end

  def show
  end

  def new
    @message = @event.messages.build
  end

  def create
    @message = @event.messages.build( params_message )
    if @message.save
      redirect_to event_messages_url( @event )
    else
      render :action => :new
    end
  end

  def edit
  end

  def update

    if @message.update( params_message )
      redirect_to event_messages_url( @event )
    else
      render :action => :edit
    end

  end

  def destroy
    @message.destroy

    redirect_to event_messages_url( @event )
  end

  protected

  def find_event
    @event = Event.find( params[:event_id] )
  end

  def params_message
    params.require(:message).permit(:name)
  end

  def find_message
    @message = @event.messages.find(params[:id])
  end
end
