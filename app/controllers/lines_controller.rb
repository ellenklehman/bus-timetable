class LinesController < ApplicationController
  def index
    @lines = Line.all
  end

  def new
    @line = Line.new
  end

  def create
    @line = Line.new(line_params)
    if @line.save
      @line.station_ids = params[:line][:station_ids]
      flash[:notice] = "New line created!"
      redirect_to line_path(@line)
    else
      render 'new'
    end
  end

  def show
    @line = Line.find(params[:id])
    @line_data = @line.line_map.to_json
  end

  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      @line.station_ids = params[:line][:station_ids]
      flash[:notice] = "Line updated successfully!"
      redirect_to line_path(@line)
    else
      render 'edit'
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.stops.destroy_all
    @line.destroy
    redirect_to lines_path
  end

private
  def line_params
    params.require(:line).permit(:name)
  end
end
