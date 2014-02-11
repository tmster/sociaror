class PytaniaController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create]

  def index
    @pytania = Pytanium.where(:status => 1).paginate(page: params[:page], :per_page => 5).order('id DESC')
  end
  
  def best
    @pytania = Pytanium.where(:status => 1).paginate(page: params[:page], :per_page => 5).order('cached_votes_score ASC')
    render "index"
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
    @pytania.parent_pytania_id=0

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

    def like
    @wykop = Pytanium.find(params[:id])
    
    if current_user.voted_as_when_voted_for(@wykop)==nil
      @wykop.liked_by current_user

      flash[:success] = "polubiles wpis!"

      redirect_to pytanium_url(@wykop)
    else
      @wykop.unliked_by current_user

      flash[:success] = "anulowano glos"

      redirect_to pytanium_url(@wykop)
    end

  end

  def dislike
    @pytanie = Pytanium.find(params[:id])
  
    if current_user.voted_as_when_voted_for(@pytanie)==nil
      @pytanie.downvote_from current_user

      flash[:success] = "wpis Ci sie nie spodobal!"

      redirect_to pytanium_url(@pytanie)

    else
      @pytanie.unliked_by current_user

      flash[:success] = "anulowano glos"

      redirect_to pytanium_url(@pytanie)
    end
  end
end
