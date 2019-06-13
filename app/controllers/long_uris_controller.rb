class LongUrisController < ApplicationController
  before_action :set_long_uri, only: [:show, :edit, :update, :destroy]

  # GET /long_uris
  # GET /long_uris.json
  def index
    @long_uris = LongUri.all
  end

  # GET /long_uris/1
  # GET /long_uris/1.json
  def show
  end

  # GET /long_uris/new
  def new
    @long_uri = LongUri.new
  end

  # GET /long_uris/1/edit
  def edit
  end

  # POST /long_uris
  # POST /long_uris.json
  def create
    @long_uri = LongUri.new(long_uri_params)

    respond_to do |format|
      if @long_uri.save
        format.html { redirect_to @long_uri, notice: 'Long uri was successfully created.' }
        format.json { render :show, status: :created, location: @long_uri }
      else
        format.html { render :new }
        format.json { render json: @long_uri.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /long_uris/1
  # PATCH/PUT /long_uris/1.json
  def update
    respond_to do |format|
      if @long_uri.update(long_uri_params)
        format.html { redirect_to @long_uri, notice: 'Long uri was successfully updated.' }
        format.json { render :show, status: :ok, location: @long_uri }
      else
        format.html { render :edit }
        format.json { render json: @long_uri.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /long_uris/1
  # DELETE /long_uris/1.json
  def destroy
    @long_uri.destroy
    respond_to do |format|
      format.html { redirect_to long_uris_url, notice: 'Long uri was successfully destroyed.' }
      format.json { head :no_content }
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
