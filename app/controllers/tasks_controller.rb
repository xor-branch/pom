class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = 'Task successfully created !'
      redirect_to tasks_path
    else
      render :new
    end

  end
  def show
  end
  def edit
  end
  def update
    if @task.update(task_params)
      flash[:success] = 'Task successfully update !'
      redirect_to tasks_path
    else
      render :edit
    end
  end

  def destroy
        @task.destroy
        flash[:danger] = 'Task successfully destroy !'
        redirect_to tasks_path
  end

  private
  def task_params
     params.require(:task).permit(:task_name, :description, :start, :deadline)
  end
  def set_task
    @task = Task.find(params[:id])
  end
end
