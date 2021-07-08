class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
    @schedules = current_user.schedules
    @schedule = Schedule.new
    @schedule.schedule_users.build
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.schedule_users.build(user_id: current_user.id)
    if @schedule.save
      flash[:success] = "新しいスケジュールを作成しました"
      redirect_to schedules_path
    else
      flash[:success] = "スケジュール作成に失敗しました"
      redirect_to root_path
    end
  end

  def update
  end

  def destroy
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name, schedule_users_attributes: [:id, :user_id])
  end
end
