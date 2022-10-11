module Languages
  class RecordsController < ApplicationController
    def new
      @record = Record.new
    end

    def create
      @record = Record.new(record_params)
      if @record.save
        redirect_to languages_path
      else
        render "languages/records/new"
      end
    end

    private
    def record_params
      params.require(:record).permit(:detail, :time).merge(language_id: params[:language_id])
    end
  end
end
