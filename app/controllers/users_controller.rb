class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :calculated_learning_time, only: [:history, :statistic]
  def show; end

  def history
    # ユーザーとlanguageに紐づいたレコードを作成降順に取得する
    if  params[:latest]
      @histories = @learning_records.latest
    elsif params[:old]
      @histories = @learning_records.old
    else
      @histories = @learning_records.latest
    end
  end

  def statistic
    @total_learning_times = @learning_records.sum('learning_hours + laerning_minutes')
    # 商と余りを出す。[時, 分]の形の配列を作る。
    @total_learning_time = @total_learning_times.divmod(60)
    # ユーザーに紐づくlanguagesとそれに紐づくrecordsを取得する(languagesが主体となっている)
    @languages = @users.find(current_user.id).languages.includes(:records).order(created_at: :asc)
    # 同じ言語をまとめて学習時間を合計する
    @records = @languages.group(:language).sum('learning_hours + laerning_minutes')
    # @recordsは["言語"　=> "学習時間"]といったハッシュになっているため、バリューの部分のみ60で割る
    @records.each do |k,v|
      record = v.divmod(60)
      @records[k] = record
    end
    # 同じ言語をまとめて学習時間を合計する
    @chart = @languages.group(:language).sum('learning_hours + laerning_minutes')
    @chart.each do |k,v|
      chart = (v * 100).to_f / @languages.sum('learning_hours + laerning_minutes')
      @chart[k] = chart.round(1)
    end
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
    # ユーザーに紐づいたrecordsからlanguagesも取得できる(recordsが主体となっている)
    @learning_records = @users.find(current_user.id).records.all 
  end

end
