class Api::V1::SchedulesController < ApplicationController
  protect_from_forgery
  before_action :authenticate_user!

  def index
    schedule_ids = ScheduleUser.where(user_id: current_user.id)&.pluck(:schedule_id)
    schedules = Schedule.where(id: schedule_ids)
    render json: schedules.map { |schedule|
      {
        id:    schedule.id,
        name:  schedule.name
      }
    }
  end

  def show
    schedule = Schedule.find(params[:id])
    render json: { name: schedule.name }
  end

  def create
    ActiveRecord::Base.transaction do
      schedule = Schedule.new(schedule_params)
      if schedule_params['name'].present?
        schedule.schedule_users.build(user_id: current_user.id)
        schedule.save!
        render json: { result: :success, data: schedule }
      else
        render json: { result: :empty }
      end
    end
  end

  # todo: updateも必要。userのupgrade&downgrade。

  def destroy
    schedule = Schedule.find(params[:id])
    schedule_user = schedule.schedule_users
    if current_user.id == (schedule_user.to_a)[0].user_id
      if schedule.destroy
        render json: { result: :success, data: schedule }
      end
    end
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name, schedule_users_attributes: [:id, :user_id])
  end
end
