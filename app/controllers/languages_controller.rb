class LanguagesController < ApplicationController
  
  def index
    @languages = Language.where(user_id: current_user.id).includes(:user)
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
    @language.user = current_user 
    if @language.save
      redirect_to languages_path
    else
      render "languages/index"
    end
  end

  def show
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    if @language.update(language_params)
      redirect_to language_path
    else
      render "languages/show"
    end
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy
    redirect_to languages_path
  end

  private
  def language_params
    params.require(:language).permit(:language)
  end
end
