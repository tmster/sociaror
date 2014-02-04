class PytaniaController < ApplicationController
  # GET /pytania
  # GET /pytania.json
  def index
    @pytania = Pytanium.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pytania }
    end
  end

  # GET /pytania/1
  # GET /pytania/1.json
  def show
    @pytanium = Pytanium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pytanium }
    end
  end

  # GET /pytania/new
  # GET /pytania/new.json
  def new
    @pytanium = Pytanium.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pytanium }
    end
  end

  # GET /pytania/1/edit
  def edit
    @pytanium = Pytanium.find(params[:id])
  end

  # POST /pytania
  # POST /pytania.json
  def create
    @pytanium = Pytanium.new(params[:pytanium])

    respond_to do |format|
      if @pytanium.save
        format.html { redirect_to @pytanium, notice: 'Pytanium was successfully created.' }
        format.json { render json: @pytanium, status: :created, location: @pytanium }
      else
        format.html { render action: "new" }
        format.json { render json: @pytanium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pytania/1
  # PUT /pytania/1.json
  def update
    @pytanium = Pytanium.find(params[:id])

    respond_to do |format|
      if @pytanium.update_attributes(params[:pytanium])
        format.html { redirect_to @pytanium, notice: 'Pytanium was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pytanium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pytania/1
  # DELETE /pytania/1.json
  def destroy
    @pytanium = Pytanium.find(params[:id])
    @pytanium.destroy

    respond_to do |format|
      format.html { redirect_to pytania_url }
      format.json { head :no_content }
    end
  end
end
