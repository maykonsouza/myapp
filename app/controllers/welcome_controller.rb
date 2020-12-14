class WelcomeController < ApplicationController
  def index
    redis = Redis.new(host: "redis", port: 6379)
    redis.incr "page hits"
    @page_hits = redis.get "page hits"



    
    address = "www.pintile.com"
    rtts = []
    for i in 1..5
      result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
      rtts.push(result)
    end
    @latence = rtts.sum/rtts.length

    @rtts_=rtts

    address = "www.google.com.br"
    rtts = []
    for i in 1..5
      result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
      rtts.push(result)
    end
    @latence1 = rtts.sum/rtts.length

    @rtts_1=rtts



    if @latence1 < 30
      indicator = ["success", "Ótima!"]
    elsif @latence1 > 30 and @latence1 < 100
        indicator = ["primary", "Boa"]
    else
      indicator = ["danger","Ruim!"]
    end

    @data1 = [{1 => rtts[0], 2 => rtts[1], 3 => rtts[2], 4 => rtts[3], 5 => rtts[4]}, address, @latence1, indicator ]

    address = "www.facebook.com.br"
    rtts = []
    for i in 1..5
      result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
      rtts.push(result)
    end
    @latence2 = rtts.sum/rtts.length

    if @latence2 < 30
      indicator = ["success", "Ótima!"]
    elsif @latence2 > 30 and @latence2 < 100
        indicator = ["primary", "Boa"]
    else
      indicator = ["danger","Ruim!"]
    end

    @data2 = [{1 => rtts[0], 2 => rtts[1], 3 => rtts[2], 4 => rtts[3], 5 => rtts[4]}, address, @latence2, indicator ]

    address = "45.231.196.1"
    rtts = []
    for i in 1..5
      result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
      rtts.push(result)
    end
    @latence3 = rtts.sum/rtts.length

    if @latence3 < 30
      indicator = ["success", "Ótima!"]
    elsif @latence3 > 30 and @latence3 < 100
        indicator = ["primary", "Boa"]
    else
      indicator = ["danger","Ruim!"]
    end

    @data3 = [{1 => rtts[0], 2 => rtts[1], 3 => rtts[2], 4 => rtts[3], 5 => rtts[4]}, address, @latence3, indicator ]
    

    address = "phys.org"
    rtts = []
    for i in 1..5
      result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
      rtts.push(result)
    end
    @latence4 = rtts.sum/rtts.length

    if @latence4 < 30
      indicator = ["success", "Ótima!"]
    elsif @latence4 > 30 and @latence4 < 100
        indicator = ["primary", "Boa"]
    else
      indicator = ["danger","Ruim!"]
    end

    @data4 = [{1 => rtts[0], 2 => rtts[1], 3 => rtts[2], 4 => rtts[3], 5 => rtts[4]}, address, @latence4, indicator ]




  end
end
