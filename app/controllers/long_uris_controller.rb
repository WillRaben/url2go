class LongUrisController < ApplicationController
  include LongUrisHelper
  before_action :set_long_uri, only: [:show]

  def show
  end

  # GET /long_uris/new
  def new
    @long_uri = LongUri.new
  end

  # POST /long_uris
  # POST /long_uris.json
  def create
    @long_uri = LongUri.new(long_uri_params)
    @long_uri.protocol_id = protocol_to_i(params[:long_uri][:org_url][/^https?\:\/\//])
    @long_uri.org_url = params[:long_uri][:org_url].sub(/^https?\:\/\/(www.)?/,'')
    respond_to do |format|
      if  @long_uri.save
          @long_uri.short_url = uri_encode(@long_uri.id)
          @long_uri.save
          format.html { redirect_to action: "show", short_url: @long_uri.short_url }
          format.json { render :json {status: 501} }
          #format.json { render :show, status: :created, location: @long_uri.short_url }
      else
          format.html { render :new }
          format.json { render :json {status: 501} }
          #format.json { render json: @long_uri.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_long_uri
      @long_uri = LongUri.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def long_uri_params
      params.require(:long_uri).permit(:org_url, :short_url, :protocol_id, :hits)
    end
end
