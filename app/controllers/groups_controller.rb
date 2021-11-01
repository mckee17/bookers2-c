class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end
  def show
  end
  def new
    @group = Group.new
  end
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

private
  def group_params
    params.require(:group).permit(:name,:introduction,:image_id,:owner_id)
  end
end
