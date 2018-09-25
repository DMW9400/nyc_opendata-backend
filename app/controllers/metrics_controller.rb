class MetricsController < ApplicationController

  def index
        artists = Metric.all
        render json: metrics, status: 200
  end

end
