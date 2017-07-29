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
      fullurl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/11-09-fotofluege-cux-allg-25a.jpg/1200px-11-09-fotofluege-cux-allg-25a.jpg',
    }
  end
end
