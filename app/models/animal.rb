class Animal < ApplicationRecord
  def map_point
    {
      name: scientific_name,
      latitude: latitude_GDA94,
      longitude: longitude_GDA94,
    }
  end
end
