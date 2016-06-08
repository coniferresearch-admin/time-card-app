class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :punches

  def total_hours(begin_range_date, end_range_date)
    punches_in_date_range = punches.where(
      'created_at >= ? AND created_at <= ?',
      begin_range_date,
      end_range_date
    ).where.not(
      clock_out: nil
    ).sort_by(&:created_at)
    time_worked = 0
    punches_in_date_range.each do |p|
      time_worked += (p.clock_out - p.clock_in)
    end
    time_worked
  end
end
