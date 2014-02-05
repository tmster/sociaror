class Admin::PytaniaController < AdminController

  def index
    @pytania = Pytanium.where(:parent_pytania_id => 0).paginate(page: params[:page])

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

  def publish
    @pytania = Pytanium.find(params[:id])
    @pytania.status=1
    @pytania.save
    flash[:success] = "Pytanie zostalo zatwierdzone"
    redirect_to admin_pytania_url 
  end  

  def unpublish
    @pytania = Pytanium.find(params[:id])
    @pytania.status=0
    @pytania.save
    flash[:success] = "Pytanie zostalo zdjete"
    redirect_to admin_pytania_url 
  end

  def create
    @pytania = Pytanium.new(params[:pytania])
    @pytania.user_id = current_user.id

      if @pytania.save
        flash[:success] = "Pytanie zostalo dodane"

        redirect_to admin_pytania_url 
      else
        render action: "new" 
      end
    
  end


  def update
    @pytania = Pytanium.find(params[:id])

      if @pytania.update_attributes(params[:pytania])
        flash[:success] = "Pytanie zostalo zaktualizowane"

        redirect_to admin_pytania_url 
      else
        render action: "edit"
      end
    
  end


  def destroy
    @pytania = Pytanium.find(params[:id])
    @pytania.destroy
    flash[:success] = "Pytanie zostalo usuniete"

    redirect_to admin_pytania_url 
  end
  
end