class CustomersController < ApplicationController

  before_action :authenticate_user!

  def index
  	@customers = Customer.includes(:jobs)
  end

  def new
  	@customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.validate
      if @customer.save
        flash[:notice] = "EQUIPO CREADO"
        redirect_to customers_path
      else
        flash[:error] = @customer.errors.full_messages
        render :new
      end
    else
      render :new
    end
  end

 private
  def customer_params
    params.require(:customer).permit(:name, :description)
  end

end
