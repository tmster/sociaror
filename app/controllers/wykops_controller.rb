class WykopsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create]

  def index
    @wykops = Wykop.where(:status => 1).paginate(page: params[:page], :per_page => 5).order('id DESC')
  end

  def best
    @wykops = Wykop.where(:status => 1).paginate(page: params[:page], :per_page => 5).order('cached_votes_score ASC')
    render "index"
  end

  def show
    @wykop = Wykop.find(params[:id])
@comments = @wykop.comments.build
@wykop.comments.pop
  end


  def new
    @wykop = Wykop.new

  end


  def edit
    @wykop = Wykop.find(params[:id])
  end


  def create
    @wykop = Wykop.new(params[:wykop])
    @wykop.user_id = current_user.id

      if @wykop.save
        flash[:success] = "Wykop zostal dodany"

        redirect_to wykops_url 
      else
        render action: "new" 
      end
    
  end

  def like
    @wykop = Wykop.find(params[:id])
    
    if current_user.voted_as_when_voted_for(@wykop)==nil
      @wykop.liked_by current_user

      flash[:success] = "polubiles wpis!"

      redirect_to wykop_url(@wykop)
    else
      @wykop.unliked_by current_user

      flash[:success] = "anulowano glos"

      redirect_to wykop_url(@wykop)
    end

  end

  def dislike
    @wykop = Wykop.find(params[:id])
  
    if current_user.voted_as_when_voted_for(@wykop)==nil
      @wykop.downvote_from current_user

      flash[:success] = "wpis Ci sie nie spodobal!"

      redirect_to wykop_url(@wykop)

    else
      @wykop.unliked_by current_user

      flash[:success] = "anulowano glos"

      redirect_to wykop_url(@wykop)
    end
  end
end
