class LongUrisController < ApplicationController
  include LongUrisHelper
  before_action :set_long_uri, only: [:show, :index]

   def index
    if @long_uri == nil
      redirect_to('/', {:flash => { :danger => "404" }})
      return
    end
    @long_uri.hits += 1
    @long_uri.save
    redirect_to i_to_protocol(@long_uri.protocol_id)+(@long_uri.org_url)
  end

  def show
    if @long_uri == nil
      redirect_to('/', {:flash => { :danger => "404" }})
      return
    end
  end

  def new
    @long_uri = LongUri.new
  end

  def create
    if (Regexp::PERFECT_URL_PATTERN =~ params[:long_uri][:org_url]) == nil
      redirect_to('/', {:flash => { :danger => "Invalid URL!"  }})
      return
    end
    respond_to do |format|
      if  @long_uri = LongUri.find_or_create_by(org_url: params[:long_uri][:org_url].sub(/^https?\:\/\//,''))
          if @long_uri.short_url != ''
            redirect_to action: "show", short_url: @long_uri.short_url
            return
          end
          @long_uri.protocol_id = protocol_to_i(params[:long_uri][:org_url][/^https?\:\/\//])
          @long_uri.short_url = uri_encode(@long_uri.id)
          @long_uri.save
          #
          #if (@long_uri.id % 100) == 0
          #  Top100ProcessJob.perform_later
          #end
          format.html { redirect_to action: "show", short_url: @long_uri.short_url }
          #format.json { render :json, status: '501'} }
          #format.json { render :show, status: :created, location: @long_uri.short_url }
      else
          format.html { render :new }
          #format.json { render :json, status: '501' }
          #format.json { render json: @long_uri.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_long_uri
      @long_uri = LongUri.find_by short_url: params[:short_url]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def long_uri_params
      params.require(:long_uri).permit(:org_url, :short_url, :protocol_id, :hits)
    end
end
