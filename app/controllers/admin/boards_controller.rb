class Admin::BoardsController < Admin::BaseController
  before_action :set_board, only: %i[edit update show destroy]

  def index
    @q = Board.ransack(params[:q])
    @boards = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def edit; end

  def update
    if @board.update(board_params)
      redirect_to admin_boards_path, success: t('defaults.message.updated', item: Board.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Board.model_name.human)
      render :edit,status: :unprocessable_entity
    end
  end

  def show; end

  def destroy
    @board = current_user.boards.find(params[:id])
    @board.destroy!
    redirect_to admin_boards_path, success: t('defaults.message.deleted', item: Board.model_name.human),status: :see_other
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:title, :body)
  end
end
