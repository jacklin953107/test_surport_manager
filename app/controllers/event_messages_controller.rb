class EventMessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_event
  before_action :find_message, :only => [:show, :update]
  before_action :find_message_destroy, :only => [:destroy, :edit]

  def index
    @messages = @event.messages
    @message = Message.new
  end

  def show
  end

  def new
    @message = @event.messages.build
  end

  def create
    @message = @event.messages.build( params_message )
    @message.user_id = current_user.id
    @message.save
    redirect_to event_messages_url( @event )
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
    redirect_to event_messages_path
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

  def find_message_destroy
    @message = @event.messages.find(params[:id])
    #@message = current_user.messages.find_by_id(params[:id])
    #byebug
    if !(current_user.messages.find_by_id(params[:id]))
      #byebug
      flash[:alert] = "無權限操作!"
      redirect_to event_messages_path
    end
  end
end
