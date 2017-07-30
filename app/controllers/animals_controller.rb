class AnimalsController < ApplicationController
  def random
    scientific_name = Animal.group(:scientific_name).select(:scientific_name).pluck(:scientific_name).sample
    path = "/animals/#{scientific_name.gsub(' ', '-')}"
    redirect_to path
  end

  def show
    name = params[:id].gsub('-', ' ').capitalize
    @animal = Animal.where("common_name = ? OR scientific_name = ?", name, name).first
    unless @animal
      flash[:notice] = "Sorry, we couldn't find that animal..."
      redirect_to root_path and return
    end

    @name = @animal.scientific_name
    animals_query = Animal.where(scientific_name: name)

    @animals_json = animals_query.where("date_last like '%2017%'").limit(1000).all.map { |a| a.map_point }.to_json

    @observations = animals_query.
      order(:date_last).
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

    @observations = Hash[@observations.sort_by { |k, v| k.to_i }]

    @page_title = @name
  end
end
