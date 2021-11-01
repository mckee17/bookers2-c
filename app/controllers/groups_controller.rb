class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @users = @group.users
    @owner = User.find_by(id: @group.owner_id)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path, notice:'You have created the group successfully.'
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    if @group.owner_id != current_user.id
      redirect_to groups_path
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to groups_path, notice:'You have updated the group successfully.'
    else
      render :edit
    end
  end

private
  def group_params
    params.require(:group).permit(:name,:introduction,:image,:owner_id)
  end
end
