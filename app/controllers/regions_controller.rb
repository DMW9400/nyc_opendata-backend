class RegionsController < ApplicationController

  def index
        regions = Region.all
        render json: regions, status: 200
  end

end
