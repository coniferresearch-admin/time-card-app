class PunchesController < ApplicationController

  before_action :active_user?

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
      punch = Punch.create(
        user_id: current_user.id,
        clock_in: Time.zone.now
      )
      flash[:punch_message] = "#{current_user.email}, clock in successful."
      sign_out :user
      redirect_to '/users/sign_in'
    elsif params[:clock_out]
      current_user.punches.last.update(
        clock_out: Time.zone.now
      )
      flash[:punch_message] = "#{current_user.email}, clock out successful."
      sign_out :user
      redirect_to '/users/sign_in'
    end
  end

  private

  def active_user?
    unless current_user
      redirect_to '/users/sign_in'
    end
  end
end
