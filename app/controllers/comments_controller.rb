class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to "/time_reports/#{@comment.time_report.id}"
    else
      redirect_to  "/time_reports/#{@comment.time_report.id}"
    end
  end

  def destroy
    redirect_to root_path unless user_signed_in? || current_user.id == @time_report.user_id && current_user.id == comment.user_id
    @comment = Comment.find(params[:time_report_id])
    if @comment.destroy
      redirect_to time_report_path
    else
      redirect_to root_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id).merge(time_report_id: params[:time_report_id])
  end
end
