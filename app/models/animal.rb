class Animal < ApplicationRecord
  JSON_PATH = "#{Rails.root}/db/site_index.json"

  class << self
    def export_json
      json = select(:scientific_name, :latitude_GDA94, :longitude_GDA94, :image_url).
        all.
        map { |a| a.map_point }.
        to_json

      File.write(JSON_PATH, json)
    end

    def load_json
      File.read(JSON_PATH)
    end
  end

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
