class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def alphabetized
    @customers = Customer.all
                         .order("fullname asc")
  end

  def missing_email
    @customers = Customer.where("email = ?", "")
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
