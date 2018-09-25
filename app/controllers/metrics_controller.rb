class MetricsController < ApplicationController

  def index
        metrics = Metric.all
        render json: metrics, status: 200
  end

end
