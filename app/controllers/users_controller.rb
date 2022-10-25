class UsersController < ApplicationController
  load_and_authorize_resource
  def show; end

  def history
    @records = User.find(current_user.id).records.all.order(created_at: :desc)
  end

  def unsubscribe; end

  def withdrawal
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = '退会処理を実行しました'
    redirect_to new_user_registration_path
  end
end
