class EventsController < ApplicationController
  def index
    
    events = Event.all.select{|event| event.provider_id == params[:provider_id].to_i}
    render json: EventSerializer.new(events)
  end

  def create
    event = Event.create(event_params)
    render json: EventSerializer.new(event)
  end

  def update
    event = Event.find(params[:id])
		event.update(event_params)
		render json: EventSerializer.new(event)
  end

  def destroy
		event = Event.find(params[:id])
		event.destroy
		render json: { message: "Sorry to hear of your loss 💀💔" }
  end

  private

  def event_params
    params.require(:event).permit(:title, :edate, :description, :provider_id)
  end
end


# {
#   "event": {
#     "title": "Crab Cookoff",
#     "edate": "2020-1-16",
#     "description": "Come together for some shell cracking and good grub",
#     "provider_id": 1
#   }
# }


