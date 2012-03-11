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
      format.html { render action: "new" }
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
    params[:search][:query].strip!
    params[:search][:category].strip!
    
    params[:search][:category] = 'restaurants' if params[:search][:category].blank?
    
    @search = Search.find_or_create_by_query_and_category(params[:search][:query], params[:search][:category])
    
    respond_to do |format|
      if @search.search
        format.html { redirect_to @search }
        format.json { render json: @search, status: :created, location: @search }
        format.js
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
