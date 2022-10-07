class LearningRecordsController < ApplicationController
  
  def index
    @learning_records = LearningRecord.all
    @learning_record = LearningRecord.new
  end

  def create
    @learning_record = LearningRecord.new(learning_record_params)
    @learning_record.user = current_user 
    if @learning_record.save
      redirect_to learning_records_path
    else
      render "learning_records/index"
    end
  end

  def show
    @learning_record = LearningRecord.find(params[:id])
  end

  def update
    @learning_record = LearningRecord.find(params[:id])
    if @learning_record.update(learning_record_params)
      redirect_to learning_record_path
    else
      render "learning_records/show"
    end
  end

  def destroy
    @learning_record = LearningRecord.find(params[:id])
    @learning_record.destroy
    redirect_to learning_records_path
  end

  private
  def learning_record_params
    params.require(:learning_record).permit(:learning_method, :language, :learning_time)
  end
end
