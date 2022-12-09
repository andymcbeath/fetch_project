class ReceiptsController < ApplicationController
  def process
    @process = Process.find(params[:id])
    render json: @process.to_json
  end

  def points
    points += retailer.length
    if total[-1] == 0 && total[-2] == 0
      points += 50
    elsif total[-1] == 5 && total[-2] == 2
      points += 25
    elsif total[-1] == 0 && total[-2] == 5
      points += 25
    elsif total[-1] == 7 && total[-2] == 5
      points += 25
    end
    points += items.length / 2
    if shortDescription.gsub(/\s+/, "").length % 3
      points += .2
    end
    if purchaseDate[-1].odd?
      points += 6
    end
    if purchaseTime
  end
end
