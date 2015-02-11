class ChefMappingsController < ApplicationController
  # GET /chef_mappings
  # GET /chef_mappings.json
  def index
    @chef_mappings = ChefMapping.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chef_mappings }
    end
  end

  # GET /chef_mappings/1
  # GET /chef_mappings/1.json
  def show
    @chef_mapping = ChefMapping.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chef_mapping }
    end
  end

  # GET /chef_mappings/new
  # GET /chef_mappings/new.json
  def new
    @chef_mapping = ChefMapping.new
    @source = []

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chef_mapping }
    end
  end

  def update_cookbook
    @source = Source.get_source(params[:name])
    # render :update do |page|
      # page.replace :chef_mapping_tool_name,:inline => "<%= select(:chef_mapping,:tool_name, @source) %>"
    # end​
    respond_to do |f|
      f.js
    end
  end

  # GET /chef_mappings/1/edit
  def edit
    @chef_mapping = ChefMapping.find(params[:id])
  end

  # POST /chef_mappings
  # POST /chef_mappings.json
  def create
    @chef_mapping = ChefMapping.new(params[:chef_mapping])

    respond_to do |format|
      if @chef_mapping.save
        format.html { redirect_to @chef_mapping, notice: 'Chef mapping was successfully created.' }
        format.json { render json: @chef_mapping, status: :created, location: @chef_mapping }
      else
        format.html { render action: "new" }
        format.json { render json: @chef_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chef_mappings/1
  # PUT /chef_mappings/1.json
  def update
    @chef_mapping = ChefMapping.find(params[:id])

    respond_to do |format|
      if @chef_mapping.update_attributes(params[:chef_mapping])
        format.html { redirect_to @chef_mapping, notice: 'Chef mapping was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chef_mapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chef_mappings/1
  # DELETE /chef_mappings/1.json
  def destroy
    @chef_mapping = ChefMapping.find(params[:id])
    @chef_mapping.destroy

    respond_to do |format|
      format.html { redirect_to chef_mappings_url }
      format.json { head :no_content }
    end
  end
end
