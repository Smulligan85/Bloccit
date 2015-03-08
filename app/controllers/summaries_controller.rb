class SummariesController < ApplicationController

  def show
    @summaries = Summary.all
  end

  def new
    @summary = Summary.new
  end

  def edit
    @summary = Summary.find(params[:id])
  end

  def create
    @summary = Summary.new(params.require(:summary).permit(:description))
    if @summary.save
      redirect_to @summary, notice: "Summary was saved."
    else
      flash[:error] = "Error saving summary. Please try again."
      render :edit
    end
  end

end