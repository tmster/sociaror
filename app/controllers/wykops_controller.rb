class WykopsController < ApplicationController
  # GET /wykops
  # GET /wykops.json
  def index
    @wykops = Wykop.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wykops }
    end
  end

  # GET /wykops/1
  # GET /wykops/1.json
  def show
    @wykop = Wykop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wykop }
    end
  end

  # GET /wykops/new
  # GET /wykops/new.json
  def new
    @wykop = Wykop.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wykop }
    end
  end

  # GET /wykops/1/edit
  def edit
    @wykop = Wykop.find(params[:id])
  end

  # POST /wykops
  # POST /wykops.json
  def create
    @wykop = Wykop.new(params[:wykop])

    respond_to do |format|
      if @wykop.save
        format.html { redirect_to @wykop, notice: 'Wykop was successfully created.' }
        format.json { render json: @wykop, status: :created, location: @wykop }
      else
        format.html { render action: "new" }
        format.json { render json: @wykop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /wykops/1
  # PUT /wykops/1.json
  def update
    @wykop = Wykop.find(params[:id])

    respond_to do |format|
      if @wykop.update_attributes(params[:wykop])
        format.html { redirect_to @wykop, notice: 'Wykop was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wykop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wykops/1
  # DELETE /wykops/1.json
  def destroy
    @wykop = Wykop.find(params[:id])
    @wykop.destroy

    respond_to do |format|
      format.html { redirect_to wykops_url }
      format.json { head :no_content }
    end
  end
end
