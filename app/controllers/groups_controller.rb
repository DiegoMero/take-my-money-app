class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(form_params.merge(user: current_user, icon: 'Icon not available yet'))

    if @group.save
      redirect_to groups_url
    else
      render :new
    end
  end

  private

  def form_params
    params.require(:group).permit(:name)
  end
end