class AnimalsController < ApplicationController
  def show
    @animal = Animal.where("common_name = ? OR scientific_name = ?", params[:id], params[:id]).first
    unless @animal
      flash[:notice] = "Sorry, we couldn't find that animal..."
      redirect_to root_path and return
    end

    @name = @animal.scientific_name

    @animals_json = Animal.
      select(:scientific_name, :latitude_GDA94, :longitude_GDA94).
      limit(500).
      all.
      map { |a| a.map_point }.
      to_json

    @page_title = @name
  end
end
