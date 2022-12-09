Rails.application.routes.draw do
  get "/receipts/:id/points" => "receipts#points"
  post "/receipts/process" => "receipts#process"
end
