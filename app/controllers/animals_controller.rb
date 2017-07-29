class AnimalsController < ApplicationController
  def show
    @name = params[:id]

    @animals_json = Animal.
      select(:scientific_name, :latitude_GDA94, :longitude_GDA94).
      limit(500).
      all.
      map { |a| a.map_point }.
      to_json

    @page_title = @name.capitalize
  end
end
