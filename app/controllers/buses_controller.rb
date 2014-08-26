class BusesController < ApplicationController
  def index
    @buses = Bus.all
  end

  def new
    @bus = Bus.new
  end

  def create
    @bus = Bus.new(bus_params)
    if @bus.save
      flash[:notice] = "New bus created!"
      redirect_to bus_path(@bus)
    else
      render 'new'
    end
  end

  def show
    @bus = Bus.find(params[:id])
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def update
    @bus = Bus.find(params[:id])
    if @bus.update(bus_params)
      flash[:notice] = "Bus updated successfully!"
      redirect_to bus_path(@bus)
    else
      render 'edit'
    end
  end

  def destroy
    @bus = Bus.find(params[:id])
    @bus.destroy
    redirect_to buses_path
  end

private
  def bus_params
    params.require(:bus).permit(:number, :line_id)
  end
end
