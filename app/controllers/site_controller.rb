class SiteController < ApplicationController
  def index
    if params[:endangered] == 't'
      @animals_json = Animal.load_json(:endangered)
    else
      @animals_json = Animal.load_json
    end

    if params[:devareas] == 'show'
      @areas_json = Area.all.map { |a| a.map_point }.to_json
    end
    @page_title = "Bushtag"
  end

  def about
    @page_title = "About #{SITE_TITLE}"
  end

  def tag
    @page_title = "Tag an animal on Instagram"
  end

  def datasets
    @bionet_datasets = Animal.group(:dataset_name).pluck(:dataset_name)

    @page_title = "Used Datasets"
  end
end
