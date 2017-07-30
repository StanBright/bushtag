class Area < ApplicationRecord
  def map_point
    {
      lat: latitude,
      lng: longitude,
      shapeid: shapeid,
    }
  end
end
