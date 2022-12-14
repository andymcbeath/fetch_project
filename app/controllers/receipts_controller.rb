class ReceiptsController < ApplicationController
  #this is my create action
  def process
    require "securerandom"
    uuid = SecureRandom.uuid
    puts "Your UUID is: " + uuid
    @receipt = Receipt.new(
      retailer: params[:retailer],
      # purchaseDate: params[:purchaseDate],
      # items: [
      #   {shortDescription: params[:shortDescription]},
      #   {price: params[:price]}]
      #   params[:items],
      # purchaseTime: params[:purchaseTime],
      # total: params[:total],
    )
    render json: @receipt.as_json
  end

  def points
    @points = 0
    @points += retailer.length
    @points += items.length / 2
    if total[-1].to_i == 0 && total[-2].to_i == 0
      @points += 50
    elsif total[-1].to_i == 5 && total[-2].to_i == 2
      @points += 25
    elsif total[-1].to_i == 0 && total[-2].to_i == 5
      @points += 25
    elsif total[-1].to_i == 7 && total[-2].to_i == 5
      @points += 25
      # eleminating blank space in shortDescription with .gsub(/\s+/, "")
    elsif shortDescription.gsub(/\s+/, "").length % 3
      @points += 0.2
    elsif purchaseDate[-1].to_i.odd?
      @points += 6
    elsif purchaseTime[0].to_i == 1 && purchaseTime[1].to_i > 4 && purchaseTime[1].to_i < 6
      @points += 10
    end
    return @points
  end
end
