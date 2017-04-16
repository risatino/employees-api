class Api::V2::EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def create
    @employee = Employee.create(
                                first_name: params[:first_name],
                                last_name: params[:last_name],
                                email: params[:email],
                                ssn: params[:ssn]
                                )

    redirect_to "/employees/#{@employee.id}.json"
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    render json: {message: "employee deleted"}  
  end
end