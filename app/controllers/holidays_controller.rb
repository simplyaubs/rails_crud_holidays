class HolidaysController < ApplicationController

  def index
    @holiday = Holiday.new
    @holidays = Holiday.all
  end

  def create
    @holiday = Holiday.new(holiday_params)
    if @holiday.save

      redirect_to holidays_path
    else
      render :index
    end
  end

  private
  def holiday_params
    params.require(:holiday).permit(:name, :celebrate)
  end
end