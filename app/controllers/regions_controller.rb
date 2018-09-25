class RegionsController < ApplicationController

  def index
        artists = Region.all
        render json: regions, status: 200
  end

end
