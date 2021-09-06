class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  def index
    @sources = current_user.sources.all
    @task = Task.find(params[:id])
  end
  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @source = Source.new
  end

  def edit
  end

  def create
    @source = Source.new (source_params)
    @source.user_id = current_user.id
    @source.save
    flash[:success] = 'source successfully create !'
    redirect_to new_source_path
  end

  def update
    if @source.update(source_params)
      flash[:success] = 'Label successfully update !'
      redirect_to new_source_path
    else
      render :edit
    end
  end

  def destroy
    @source.destroy
    flash[:success] = 'label successfully destroy !'
    redirect_to new_source_path
  end

  private
  def source_params
    params.require(:source).permit(:title, :content)
  end
  def set_source
    @source = Source.find(params[:id])
  end
end
