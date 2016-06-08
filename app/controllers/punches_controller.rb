class PunchesController < ApplicationController
  def index
    if current_user
      @user = current_user
      @punches = current_user.punches if current_user.punches
    else
      redirect_to '/users/sign_in'
    end
  end

  def create
    input_event_type = params[:event_type]
    punch = Punch.new(
      event_type: input_event_type,
      user_id: current_user.id
    )
    if punch.save
      flash[:punch_message] = "#{punch.event_type} successfull." 
      sign_out :user
      redirect_to '/users/sign_in'
    else
      render 'index.html.erb'
    end
  end
end
