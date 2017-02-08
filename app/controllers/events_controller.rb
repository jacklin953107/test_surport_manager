class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_event, :only => [ :edit, :update, :destroy]
  def index
    @events = Event.all.page(params[:page]).per(5)
    if params[:type]=='new'
      @event = Event.new
    elsif params[:type]=='edit'
      @event = Event.find(params[:id])
    elsif params[:type]=='update'
      flash[:notice] = "事件修改成功！"
    end
  end

  def new
    @event =Event.new
    @type = params[:type]
    redirect_to events_url(:type => @type)
  end

  def create
    #@event = Event.new(event_params)
    #byebug
    @event = current_user.events.new(event_params)
    #byebug
    @event.save
    if @event.save
      flash[:notice] = "新增成功！"
      redirect_to events_path
    else
      flash[:alert] = "欄位需全部填寫！"
      redirect_to :back
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    #byebug
    @id = params[:id]
    @type = params[:type]
    #byebug
    redirect_to events_url(:id => @id, :type => @type)
  end

  def update
    #byebug
    @event.update(event_params)
    #redirect_to :action => :show, :id => @event
    redirect_to events_path(:type => 'update')
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
