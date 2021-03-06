class Admin::UserSessionsController < Admin::BaseController
  layout 'layouts/admin_login'
  skip_before_action :check_admin, only: %i[new create], raise: false
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to admin_root_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to admin_login_path, success: t('.success', status: :see_other)
  end
end
