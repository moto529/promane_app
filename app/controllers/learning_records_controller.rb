class LearningRecordsController < ApplicationController
  
  def index
    @learning_records = LearningRecord.all
    @learning_record = LearningRecord.new
  end

  def create
    @learning_record = LearningRecord.new(learning_record_params)
    if @learning_record.save
      redirect_to learning_records_path
    else
      render "learning_records/index"
    end
  end

  private
  def learning_record_params
    params.require(:learning_record).permit(:learning_method, :language, :learning_time)
  end
end
