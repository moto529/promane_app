class LanguagesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  def index
    # ユーザーに紐づく言語を取得
    @user_languages = Language.where(user_id: current_user.id).includes(:user)
    @language = Language.new
  end

  def create
    @language.user = current_user
    if @language.save
      redirect_to languages_path
    else
      @user_languages = Language.where(user_id: current_user.id).includes(:user)
      render 'languages/index', status: :unprocessable_entity
    end
  end

  def show
    @records = @language.records
  end

  def update
    if @language.update(language_params)
      redirect_to languages_path
    else
      @records = @language.records
      render 'languages/show', status: :unprocessable_entity
    end
  end

  def destroy
    @language.destroy
    redirect_to languages_path
  end

  private

  def language_params
    params.require(:language).permit(:language)
  end
end
