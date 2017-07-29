class AnimalsController < ApplicationController
  def show
    name = params[:id].gsub('-', ' ').capitalize
    @animal = Animal.where("common_name = ? OR scientific_name = ?", name, name).first
    unless @animal
      flash[:notice] = "Sorry, we couldn't find that animal..."
      redirect_to root_path and return
    end

    @name = @animal.scientific_name

    @animals_json = Animal.
      where(scientific_name: name).
      all.
      map { |a| a.map_point }.
      to_json

    @observations = Animal.
      where(scientific_name: name).
      order(:date_last).
      all.
      reduce({}) do |data, animal|
        begin
          year = Date.parse(animal.date_last).year
          unless data[year]
            data[year] = 0
          end
        rescue => e
          next
        end

        data[year] += animal.number_individuals.to_i.presence || 1
        data
      end

    @page_title = @name
  end
end
