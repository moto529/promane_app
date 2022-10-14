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
        render "languages/records/new", status: :unprocessable_entity
      end
    end

    def show
      @record = Record.find(params[:id])
      @language = Language.find(params[:language_id])
    end

    def update
      @record = Record.find(params[:id])
      if @record.update(record_params)
        redirect_to language_path(params[:language_id])
      else
        render "languages/records/show"
      end
    end

    def destroy
      @record = Record.find(params[:id])
      @record.destroy
      redirect_to language_path(params[:language_id])
    end

    private
    def record_params
      params.require(:record).permit(:detail, :time).merge(language_id: params[:language_id])
    end
  end
end
