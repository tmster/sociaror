class WykopsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create]

  def index
    @wykops = Wykop.where(:status => 1).paginate(page: params[:page], :per_page => 5).order('id DESC')
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
end
