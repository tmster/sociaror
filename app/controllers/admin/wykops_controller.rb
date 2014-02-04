class Admin::WykopsController < AdminController

  def index
    @wykops = Wykop.paginate(page: params[:page])

  end


  def show
    @wykop = Wykop.find(params[:id])

  end


  def new
    @wykop = Wykop.new

  end


  def edit
    @wykop = Wykop.find(params[:id])
  end

  def publish
    @wykop = Wykop.find(params[:id])
    @wykop.status=1
    @wykop.save
    flash[:success] = "Wykop zostal zatwierdzony"
    redirect_to admin_wykops_url 
  end  

  def unpublish
    @wykop = Wykop.find(params[:id])
    @wykop.status=0
    @wykop.save
    flash[:success] = "Wykop zostal zdjety"
    redirect_to admin_wykops_url 
  end

  def create
    @wykop = Wykop.new(params[:wykop])
    @wykop.user_id = current_user.id

      if @wykop.save
        flash[:success] = "Wykop zostal dodany"

        redirect_to admin_wykops_url 
      else
        render action: "new" 
      end
    
  end


  def update
    @wykop = Wykop.find(params[:id])

      if @wykop.update_attributes(params[:wykop])
        flash[:success] = "Wykop zostal zaktualizowany"

        redirect_to admin_wykops_url 
      else
        render action: "edit"
      end
    
  end


  def destroy
    @wykop = Wykop.find(params[:id])
    @wykop.destroy
    flash[:success] = "Wykop zostal usuniety"

    redirect_to admin_wykops_url 
  end
  
end
