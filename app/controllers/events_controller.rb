class EventsController < ApplicationController
  before_action :require_login, only: [:new, :show]

  def index
    @all_events = Event.all
    @events = Event.where(nil)
    @events = @events.interests(params[:interest]) if params[:interest].present?
    @events = @events.mood(params[:mood]) if params[:mood].present?

  end

  def new
    @event = Event.new
    @events = Event.all

    @categories = {
      'Outdoors' => ['Cycling', 'Camping', 'Hiking', 'Fishing'],
      'Technology' => ['Crypto', 'SEO', 'E-Commerce'],
      'Health' => ['Fitness', 'Nutrition', 'Yoga'],
      'Education' => ['Math', 'Engineering', 'Science'],
      'Food & Drink' => ['Coffee', 'Vegan', 'Wine'],
    }
    @category = @categories.keys.each { |cat| cat }    
    @sub_categories = []
    
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

    if @event.save
      redirect_to event_path(@event.id)
    else
      render 'events/new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @user = User.find(@event.user_id)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to root_path
    else
      render '/event/edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    # if current_user.superadmin?
    #   redirect_to events_path
    # else 
    #   redirect_to event_path
    # end
  end

  private
    def event_params
      params.require(:event).permit(:title, :description, :location, :date, :time, :cost, :status, :participants, :event_type, :category, :sub_category, :mood, {images: []})
    end
    
    # def require_login
    #   unless signed_in? && (current_user.superadmin? || current_user.moderator?)
    #     flash[:error] = "You must be logged in to access this section"
    #     # redirect_to root_path
    #   end
    # end
        
end