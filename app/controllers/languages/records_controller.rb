module Languages
  class RecordsController < ApplicationController
    load_and_authorize_resource :language
    load_and_authorize_resource through: :language
    before_action :authenticate_user!
    
    def new; end

    def create
      if @record.save
        flash[:notice] = "#{@language.language}の学習を記録しました"
        redirect_to history_users_path
      else
        render 'languages/records/new', status: :unprocessable_entity
      end
    end

    def show; end

    def update
      if @record.update(record_params)
        flash[:notice] = "#{@language.language}の学習を編集しました"
        redirect_to history_users_path
      else
        @record = Record.find(params[:id])
        @language = Language.find(params[:language_id])
        render 'languages/records/show', status: :unprocessable_entity
      end
    end

    def destroy
      @record.destroy
      flash[:notice] = "#{@language.language}の学習を削除しました"
      redirect_to history_users_path
    end

    private

    def record_params
      params.require(:record).permit(:detail, :learning_hours, :laerning_minutes).merge(language_id: params[:language_id])
    end
  end
end
