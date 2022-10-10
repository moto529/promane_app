class RecordsController < ApplicationController
  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to root_path
    else
      render "records/new"
    end
  end

  private
  def record_params
    params.require(:record).permit(:detail, :time, :language_id)
  end
end
