module Languages
  class RecordsController < ApplicationController
    load_and_authorize_resource :language
    load_and_authorize_resource through: :language
    before_action :authenticate_user!
    
    def new; end

    def create
      if @record.save
        redirect_to history_path
      else
        render 'languages/records/new', status: :unprocessable_entity
      end
    end

    def show; end

    def update
      if @record.update(record_params)
        redirect_to history_path
      else
        @record = Record.find(params[:id])
        @language = Language.find(params[:language_id])
        render 'languages/records/show', status: :unprocessable_entity
      end
    end

    def destroy
      @record.destroy
      redirect_to history_path
    end

    private

    def record_params
      params.require(:record).permit(:detail, :time).merge(language_id: params[:language_id])
    end
  end
end
