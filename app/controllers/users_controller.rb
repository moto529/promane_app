class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :calculated_learning_time, only: [:statistic]
  def show; end

  def history
    # ユーザーとlanguageに紐づいたレコードを作成降順に取得する
    if  params[:latest]
      @histories = @users.find(current_user.id).records.latest
    elsif params[:old]
      @histories = @users.find(current_user.id).records.old
    else
      @histories = @users.find(current_user.id).records.latest
    end
  end

  def statistic
    # 商と余りを出す。[時, 分]の形の配列を作る。
    @total_learning_time = @total_learning_times.divmod(60)
    @languages = @users.find(current_user.id).languages.includes(:records)
  end

  def unsubscribe; end

  def withdrawal
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = '退会処理を実行しました'
    redirect_to new_user_registration_path
  end

  private
  def calculated_learning_time
    # ユーザーとlanguageに紐づいたレコード
    @learning_records = @users.find(current_user.id).records.all
    # 学習時間(時)の合計すでに分表示にしてある。
    @total_learning_hours_to_minutes = @learning_records.sum(:learning_hours)
    # 学習時間(分)の合計
    @total_learning_minutes = @learning_records.sum(:laerning_minutes)
    # 学習時間全体の合計
    @total_learning_times = @total_learning_hours_to_minutes + @total_learning_minutes
  end

end
