class GroupUsersController < ApplicationController
  def create
    @group = GroupUser.new
    @group.user_id = current_user.id
    @group.group_id = params[:group_id]
    @group.save
    redirect_to group_path(params[:group_id])
  end

  def destroy
    @group = GroupUser.find_by(user_id: current_user.id, group_id: params[:group_id])
    @group.destroy
    redirect_to group_path(params[:group_id])
  end

end
