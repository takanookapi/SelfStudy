class TimeReportsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_time_report, only: [:destroy, :update, :edit]


  def index
    if user_signed_in?
      @time_reports = TimeReport.where(user_id: current_user.id).includes(:user).order("created_at DESC")
    else
      redirect_to user_session_path
    end
  end

  def new
    @time_report = TimeReport.new
  end

  def create
    @time_report = TimeReport.new(study_datefiled_time_params)
    @user = User.find(current_user.id)
    @user.sum_time += @time_report.study_time
    @user.exp_point += @time_report.exp.to_i
    @user.level = @user.exp_point.to_i / 30
    @user.update(exp_point: @user.exp_point, level: @user.level)
    if @time_report.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @time_report.user_id
  end

  def update
    if @time_report.update(study_datefiled_time_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to new_user_session_path unless user_signed_in?
    if @time_report.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    redirect_to new_user_session_path unless user_signed_in?
    @time_report = TimeReport.find(params[:id])
    @comment = Comment.new
    @comments = @time_report.comments.includes(:user)
  end

  private

  def set_time_report
    @time_report = TimeReport.find(params[:id])
  end

  def study_datefiled_time_params
    params.require(:time_report).permit(:study_date, :study_time, :memo, :exp).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
