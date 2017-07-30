class Animal < ApplicationRecord
  JSON_PATH = "#{Rails.root}/db/site_index"

  class << self
    def json_path(kind)
      path = JSON_PATH
      if kind.present?
        path += "_#{kind}.json"
      else
        path += '.json'
      end
    end

    def export_json(kind = nil)
      query =
        select(:scientific_name, :latitude_GDA94, :longitude_GDA94, :image_url).
        where(date_last: '16')

      if kind == :endangered
        query = query.where("nsw_status like '%E%' OR nsw_status like '%P%' OR nsw_status like '%V%'")
      end

      json = query.all.map { |a| a.map_point }.to_json

      File.write(json_path(kind), json)
    end

    def load_json(kind = nil)
      File.read(json_path(kind))
    end
  end

  def path
    "/animals/#{scientific_name.gsub(' ', '-')}"
  end

  def name_to_show
    common_name.presence || scientific_name
  end

  def observations_count
    c = number_individuals
    if c.nil?
      1
    else
      c = c.to_i
      c = 1 if c == 0
      c
    end
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
