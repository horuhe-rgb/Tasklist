class TasksController < ApplicationController
  
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index 
    @tasks = Task.all
  end
  
  def show
    
  end

  def new 
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = "Taskが登録されました"
      redirect_to @task
    else 
      flash.now[:danger] = "Taskの登録に失敗しました"
      render :new
    end
  end

  def edit
    
  end

  def update 
    
    if @task.update(task_params)
      flash[:success] = "Taskが更新されました"
      redirect_to @task
    else 
      flash.now[:danger] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    flash[:success] = "Taskを削除しました"
    redirect_to root_path
  end
  

  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  #StrongParamater
  def task_params
    params.require(:task).permit(:content, :status)
  end

end
