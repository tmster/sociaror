class Admin::UsersController < AdminController
  before_filter :admin_user

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Uytkownik zostal usuniety."
    redirect_to admin_users_url
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
  	@user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = 'Uzytkownik zostal dodany!'
      redirect_to admin_users_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profil zostal zaktualizowany"
      redirect_to admin_users_url
    else
      render 'edit'
    end
  end


end
