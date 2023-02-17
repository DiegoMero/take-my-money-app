class ActionsController < ApplicationController
  before_action :set_group
  before_action :authenticate_user!

  def new
    @action = Action.new
  end

  def create
    @action = Action.new(form_params)
    @action.user = current_user
    @group.actions << @action
  
    if @action.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end
  
  private

  def form_params
    params.require(:action).permit(:name, :amount)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end