class ServerInfosController < ApplicationController
  # GET /server_infos
  # GET /server_infos.json
  def index
    @server_infos = ServerInfo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @server_infos }
    end
  end

  # GET /server_infos/1
  # GET /server_infos/1.json
  def show
    @server_info = ServerInfo.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @server_info }
    end
  end

  def trigger_script
    EM.defer do
      @server_info = ServerInfo.find(params[:id])
      @server_info.set_script
      request.env['async.callback'].call response
    end
  end

  def console_log
    EM.defer do
    @server_info = ServerInfo.find(params[:id])
    respond_to do |format|
      format.js
    end
          request.env['async.callback'].call response

  end
      # throw :console_log

  end

  # GET /server_infos/new
  # GET /server_infos/new.json
  def new
    @server_info = ServerInfo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @server_info }
    end
  end

  # GET /server_infos/1/edit
  def edit
    @server_info = ServerInfo.find(params[:id])
  end

  # POST /server_infos
  # POST /server_infos.json
  def create
    @server_info = ServerInfo.new(params[:server_info])

    respond_to do |format|
      if @server_info.save
        format.html { redirect_to @server_info, notice: 'Server info was successfully created.' }
        format.json { render json: @server_info, status: :created, location: @server_info }
      else
        format.html { render action: "new" }
        format.json { render json: @server_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /server_infos/1
  # PUT /server_infos/1.json
  def update
    @server_info = ServerInfo.find(params[:id])

    respond_to do |format|
      if @server_info.update_attributes(params[:server_info])
        format.html { redirect_to @server_info, notice: 'Server info was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @server_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /server_infos/1
  # DELETE /server_infos/1.json
  def destroy
    @server_info = ServerInfo.find(params[:id])
    @server_info.destroy

    respond_to do |format|
      format.html { redirect_to server_infos_url }
      format.json { head :no_content }
    end
  end
end
