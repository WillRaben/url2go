class TopHitsController < ApplicationController
  
  def index
    @top_hits = TopHit.all
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top_hit_params
      params.require(:top_hit).permit(:title, :short_url, :hits)
    end
end
