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

    @observations = animals_query.
      order(:date_last).
      reduce({}) do |data, animal|
        begin
          year = animal.date_last
          unless data[year]
            data[year] = 0
          end
          data[year] += animal.observations_count
        rescue => e
          next
        end

        data
      end


    @observations = @observations.sort_by { |k, v| k.to_i }
    last_year = @observations.last.first
    @observations = Hash[@observations]
    last_year = '16' if last_year == '17'

    @animals_json = animals_query.where(date_last: last_year).limit(1000).all.map { |a| a.map_point }.to_json

    @page_title = @name
  end
end
