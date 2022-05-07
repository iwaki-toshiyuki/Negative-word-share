class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin/layouts/application' # 読み込みたいレイアウトを指定
  # レイアウトは一般画面と管理画面で分けたいためlayoutsで指定する必要がある

  private

  def not_authenticated
    flash[:warning] = t('defaults.message.require_login')
    redirect_to admin_login_path,status: :unprocessable_entity
  end

  def check_admin # admin権限でない場合はトップページに遷移させる
    redirect_to root_path,  warning: t('defaults.message.not_authorized', status: :see_other)  unless current_user.admin?
  end
end
