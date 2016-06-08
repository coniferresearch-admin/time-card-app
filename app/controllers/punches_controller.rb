class PunchesController < ApplicationController
  def index
    @user = current_user
    if current_user.punches.any? && current_user.punches.last.clock_out.nil?
      @punch_type = "Clock Out"
      @last_clock_in = current_user.punches.last.clock_in
    else
      @punch_type = "Clock In"
    end
    @punch_param = @punch_type.split(' ').join('_').downcase
  end

  def create
    if params[:clock_in]
      Punch.create(
        user_id: current_user.id,
        clock_in: Time.zone.now
      )
      redirect_to '/'
    elsif params[:clock_out]
      current_user.punches.last.update(
        clock_out: Time.zone.now
      )
      redirect_to '/'
    end
  end
end
