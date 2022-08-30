# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.all
    tasks = Task.all
    render status: :ok, json: { tasks: tasks }
  end

  def create
    task = Task.new(task_params)
    task.save!
    respond_with_success(t("successfully_created"))
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end

    def show
      task = Task.find_by!(slug: params[:slug])
      respond_with_json({ task: task })
    end
end
