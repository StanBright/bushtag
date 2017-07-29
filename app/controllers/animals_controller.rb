class AnimalsController < ApplicationController
  def show
    name = params[:id].gsub('-', ' ')
    @animal = Animal.where("common_name = ? OR scientific_name = ?", name, name).first
    unless @animal
      flash[:notice] = "Sorry, we couldn't find that animal..."
      redirect_to root_path and return
    end

    @name = @animal.scientific_name

    @animals_json = Animal.
      where(scientific_name: name).
      limit(500).
      all.
      map { |a| a.map_point }.
      to_json

    @page_title = @name
  end
end
