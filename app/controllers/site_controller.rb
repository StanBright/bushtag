class SiteController < ApplicationController
  def index
    # @animals_json = Animal.
    #   select(:scientific_name, :latitude_GDA94, :longitude_GDA94, :image_url).
    #   # limit(50000).
    #   all.
    #   map { |a| a.map_point }.
    #   to_json
    @animals_json = Animal.load_json
  end

  def about
    @page_title = "About #{SITE_TITLE}"
  end

  def tag
    @page_title = "Tag an animal on Instagram"
  end
end
