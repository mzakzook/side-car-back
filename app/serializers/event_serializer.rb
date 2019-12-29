class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :edate, :description
  belongs_to :provider
end
