class PytaniaController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create]

  def index
    @pytania = Pytanium.where(:status => 1).paginate(page: params[:page], :per_page => 5).order('id DESC')
  end


  def show
    @pytania = Pytanium.find(params[:id])

  end


  def new
    @pytania = Pytanium.new

  end


  def edit
    @pytania = Pytanium.find(params[:id])
  end


  def create
    @pytania = Pytanium.new(params[:pytanium])
    @pytania.user_id = current_user.id

      if @pytania.save
        flash[:success] = "Pytanie zostalo dodane"

        redirect_to pytania_url 
      else
        render action: "new" 
      end
    
  end

  def update
    @pytanie = Pytanium.find(params[:id])
    @pytania = Pytanium.new(params[:pytanium])
    @pytania.user_id = current_user.id
    @pytania.parent_pytania_id=@pytanie.id
      if @pytania.save
        flash[:success] = "Odpowiedz zostala dodana"

        redirect_to pytanium_url(@pytanie)
      else
        render action: "new" 
      end
  end
end
