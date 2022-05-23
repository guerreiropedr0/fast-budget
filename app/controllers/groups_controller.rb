class GroupsController < ApplicationController
  load_and_authorize_resource

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to root_path, notice: 'Successfully created a group.'
    else
      flash[:alert] = 'Failed to create a group.'
      render :new
    end
  end

  private

  def group_params
    gp = params.require(:group).permit(:name, :icon)
    gp[:author_id] = current_user.id
    gp
  end
end
