class Animal < ApplicationRecord
  def path
    "/animals/#{scientific_name.gsub(' ', '-')}"
  end

  def name_to_show
    common_name.presence || scientific_name
  end

  def map_point
    {
      name: scientific_name,
      latitude: latitude_GDA94,
      longitude: longitude_GDA94,
      path: path,
      fullurl: image_url,
    }
  end
end
