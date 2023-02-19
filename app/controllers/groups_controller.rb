class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.where(author_id: current_user)
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(form_params.merge(author: current_user))

    if @group.save
      redirect_to groups_url
    else
      render :new
    end
  end

  private

  def form_params
    params.require(:group).permit(:name, :icon)
  end
end
