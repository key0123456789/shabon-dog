class Api::V1::SchedulesController < ApplicationController
  before_action :authenticate_user!

  def index
    schedule_ids = ScheduleUser.where(user_id: current_user.id)&.pluck(:schedule_id)
    schedules = Schedule.where(id: schedule_ids)
    render json: schedules.map { |schedule|
      {
        id:          schedule.id,
        name:        schedule.name
      }
    }
  end

end
