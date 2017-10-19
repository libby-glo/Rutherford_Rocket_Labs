class EmployeesController < ApplicationController

  def new
    @employee = Employee.new()
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to "/"
    else
      @errors = @employee.errors.full_messages
      render :new
    end
  end

  private
  def employee_params
    if params[:employee][:is_manager] == 'true'
      params[:employee][:is_manager] = true
    elsif params[:employee][:is_manager] == 'false'
      params[:employee][:is_manager] = false
    end
    params.require(:employee).permit(:first_name, :last_name, :employee_id, :password, :is_manager)
  end


end