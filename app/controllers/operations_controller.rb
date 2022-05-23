class OperationsController < ApplicationController
  load_and_authorize_resource

  def new
    @operation = Operation.new
  end

  def create
    @operation = Operation.new(operation_params)

    helpers.create_groups_operations(@operation, params[:group][:group_id])

    if @operation.save
      redirect_to root_path, notice: 'Successfully created an operation.'
    else
      flash[:alert] = 'Failed to create an operation.'
      render :new
    end
  end

  private

  def operation_params
    op = params.require(:operation).permit(:name, :amount)
    op[:author_id] = current_user.id
    op
  end
end
