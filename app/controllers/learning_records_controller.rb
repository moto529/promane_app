class LearningRecordsController < ApplicationController
  
  def index
    @learning_records = LearningRecord.all 
  end

end
