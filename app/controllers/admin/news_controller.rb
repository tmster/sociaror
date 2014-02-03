class Admin::NewsController < AdminController

  def index
    @news = News.paginate(page: params[:page])

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

        redirect_to admin_news_index_url 
      else
        render action: "new" 
      end
    
  end


  def update
    @news = News.find(params[:id])

      if @news.update_attributes(params[:news])
        flash[:success] = "News zostal zaktualizowany"

        redirect_to admin_news_index_url 
      else
        render action: "edit"
      end
    
  end


  def destroy
    @news = News.find(params[:id])
    @news.destroy
    flash[:success] = "News zostal usuniety"

    redirect_to admin_news_index_url 
  end
  
end
