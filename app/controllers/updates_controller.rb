class UpdatesController < ApplicationController
  def data_collect
    response = HTTParty.get('https://api.myjson.com/bins/gx6vz')
    d = JSON.parse(response.body)
    data = d["prices"]
    update_data data

  end

  def update_data(data)
    data.each_with_index do |item, index|
      p               = Product.new
      p.name          = item["name"]
      p.unit_price    = item["unit_price"]
      p.special_qty   = item["special_qty"]
      p.special_price = item["special_price"]
      if Product.exists?(name: p.name)
      else
        p.save
      end
    end

    redirect_to root_path
  end  
end

