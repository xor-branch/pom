class UsersController < ApplicationController
  before_action :set_user, only:[:show, :edit, :destroy, :update]
  skip_before_action :login_required, only: [:new, :create]

  def index
  end
  def show
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = t('controller.user.create_success')
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.new
  end
  def update
    if @user.update
      flash[:success] = t('controller.user.update_success')
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:danger] = t('controller.user.destroy_success')
    redirect_to tasks_path
  end

  private
  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :telephone,
                                 :bio,
                                 :password,
                                 :password_confirmation
                               )
  end
  def set_user
    @user = User.find(params[:id])
  end
end
