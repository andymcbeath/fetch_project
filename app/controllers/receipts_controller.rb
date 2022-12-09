class ReceiptsController < ApplicationController
  def process
    @process = Process.find(params[:id])
    render json: @process.to_json
  end

  def points
    points += retailer.length
    if total[-1].to_i == 0 && total[-2].to_i == 0
      points += 50
    elsif total[-1].to_i == 5 && total[-2].to_i == 2
      points += 25
    elsif total[-1].to_i == 0 && total[-2].to_i == 5
      points += 25
    elsif total[-1].to_i == 7 && total[-2].to_i == 5
      points += 25
    end
    points += items.length / 2
    if shortDescription.gsub(/\s+/, "").length % 3
      points += .2
    end
    if purchaseDate[-1].to_i.odd?
      points += 6
    end
    if purchaseTime[0].to_i == 1 && purchaseTime[1].to_i > 4 && purchaseTime[1].to_i < 6
      points += 10
  end
  return points
end
