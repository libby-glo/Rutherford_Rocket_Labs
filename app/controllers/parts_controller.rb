class PartsController < ApplicationController

def index
  if logged_in?
    render :index
  else
    redirect_to '/'
  end
end

def new
end

def create
  if quantity_zero?
    flash[:notice] = "Please enter valid quantities"
    render :new
  else
    @order = Order.last
    create_parts
    @parts = @order.parts
    flash.clear
    redirect_to affirm_path(@order)
  end
end

def show
  if logged_in?
    part = Part.find(params[:id])
    @parts = Part.all_of_type(part.part_no)
  else
    redirect_to '/'
  end
end

private


end
