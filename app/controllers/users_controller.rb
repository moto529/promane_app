class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def history
    @records = User.find(current_user.id).records.all.order(created_at: :desc)
  end

  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = '退会処理を実行しました'
    redirect_to new_user_registration_path
  end
end
