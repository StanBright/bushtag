class DiscoverController < ApplicationController
  def index
    @animals = Animal.
      group(:scientific_name, :common_name, :family_name).
      select(:scientific_name, :common_name, :family_name).
      all

    @page_title = "Browse all our furry friends..."
  end
end
