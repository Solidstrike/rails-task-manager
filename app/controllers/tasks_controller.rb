class TasksController < ApplicationController
before_action :find_task, only: [:show, :edit, :update, :destory]
  
  def new
    @task = Task.new
  end
  
  def create
      @task = Task.new(strong_params)
      @task.save
      # no need for app/views/restaurants/create.html.erb
      redirect_to tasks_path
  end
  

  def index
    @tasks = Task.all
  end

  def show
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end
  

  def edit
  end

  def update
    @task.update(strong_params)
    redirect_to task_path(@task)
  end


  private

  def strong_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end

