class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.json
  #   def index
  #     respond_to do |format|
  #       format.html # index.html.erb
  #       format.json { render json: @searches }
  #     end
  #   end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @search = Search.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/new
  # GET /searches/new.json
  def new
    @search = Search.new
    @location = request.location.city
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search }
    end
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(params[:search])
    
    respond_to do |format|
      if @search.search && @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render json: @search, status: :created, location: @search }
      else
        format.html { render action: "new" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
  def find_location
    @client_ip = request.remote_ip
    location = IpGeocoder.geocode(@client_ip)
    return location  
  end
end
