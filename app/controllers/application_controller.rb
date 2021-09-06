class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :login_required
  private
  def login_required
    redirect_to new_session_path unless current_user
  end

  def user_check
    if current_user.id != @task.id
      redirect_to task_path(@task.id)
      flash[:danger] = 'Seul le proprietaire de cette tache peut faire cette action !'
    end
  end
end
