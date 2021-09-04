class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:urgence]
      @tasks = current_user.tasks.order(deadline: :DESC).page params[:page]
    elsif params[:low]
      @tasks = current_user.tasks.where(priority: :low).page params[:page]
    elsif params[:medium]
      @tasks = current_user.tasks.where(priority: :medium).page params[:page]
    elsif params[:high]
      @tasks = current_user.tasks.where(priority: :high).page params[:page]
    elsif params[:task_name] && params[:statut]
      if params[:task_name]==''
        @tasks = current_user.tasks.where(statut:params[:statut]).page params[:page]
      else
        #@tasks = Task.all.where(task_name: params[:task_name])
        @tasks = current_user.tasks.where("task_name LIKE ?
                                or description LIKE ?",
                                "%#{params[:task_name]}%",
                                "%#{params[:task_name]}%").page params[:page]

      end
    else
      @tasks = current_user.tasks.order(created_at: :DESC).page params[:page]
    end
  end

  def new
    @tasks = current_user.tasks
    @task = Task.new
    @task.steps.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    if @task.save
      flash[:success] = t('controller.task.create_success')
      redirect_to @task
    else
      render :new
    end
  end

  def show
  end
  def step
    @step = Step.find(params[:id])
    @steps = @step.task.steps
  end

  def edit
    @task.steps.new
  end

  def update
    if @task.update(task_params)
      flash[:success] = t('controller.task.update_success')
      redirect_to edit_task_path(@task)
    else
      render :edit
    end

  end

  def destroy
        @task.destroy
        flash[:danger] = t('controller.task.destroy_success')
        redirect_to tasks_path
  end

  private
  def task_params
     params.require(:task).permit(:task_name,
                                  :description,
                                  :start,
                                  :deadline,
                                  :statut,
                                  :priority,
                                  steps_attributes: {} )
  end
  def set_task
    @task = Task.find(params[:id])
    @steps = @task.steps
  end
end
