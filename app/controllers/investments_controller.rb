class InvestmentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.find(params[:group_id])
    @investment = Investment.new
  end

  def create
    @investment = Investment.new(form_params.merge(user: current_user))
    @group = Group.find(params[:group_id])

    if @investment.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end
  
  private

  def form_params
    params.require(:investment).permit(:name, :amount, group_ids: [])
  end
end