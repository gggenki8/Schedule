class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start_day, :end_day, :all_day, :memo))
    if @task.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :tasks
    else
      flash[:notice_no_create] = "スケジュールの登録に失敗しました"
      render :"new"
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice_update] = "スケジュールを更新しました"
      redirect_to :tasks
    else
      flash[:notice_no_update] = "スケジュールの更新に失敗しました"
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :tasks
  end

end

private

def task_params
  params.require(:task).permit(:title, :start_day, :end_day, :all_day, :memo)
end