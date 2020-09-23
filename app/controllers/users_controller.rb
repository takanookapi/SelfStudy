class UsersController < ApplicationController

  # def create
  #   @time_report = TimeReport.new(study_datefiled_time_params)
  #   @user = User.find(current_user.id)
  #   @user.exp_point +=  @time_report.exp
  #   # @user.level = @user.exp_point.to_i / 100
  #   @user.level = Levelup.find_by(level_up: @user.level + 1);
  #   @current_user.update(exp_point: @user.exp_point, level: @user.level)
  #   #ここから重要です！レベルセッティングのモデルから、今の自分のレベルより1高いレコードを探させます。
  #   #そしてそれを変数に入れておきます
  
  #   if @levelup.thresold <= user.experience_point
  #   #探してきたレコードの閾値よりもユーザーの総経験値が高かった場合
  #     @user.level = @user.level + 1
  #     @user.update(level: user.level)
  #   end
  #   #レベルを1増やして更新
  #   current_user.update(exp_point: @user.exp_point, level: @user.level)
  #   if @time_report.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

end
