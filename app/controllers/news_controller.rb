class NewsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create]

  def index
    @news = News.where(:status => 1).paginate(page: params[:page], :per_page => 5).order('id DESC')

  end


  def show
    @news = News.find(params[:id])

  end


  def new
    @news = News.new

  end


  def edit
    @news = News.find(params[:id])
  end


  def create
    @news = News.new(params[:news])
    @news.user_id = current_user.id

      if @news.save
        flash[:success] = "News zostal dodany"

        redirect_to news_index_url 
      else
        render action: "new" 
      end
    
  end


end
