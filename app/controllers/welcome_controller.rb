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

    @data1 = [{1 => rtts[0], 2 => rtts[1], 3 => rtts[2], 4 => rtts[3], 5 => rtts[4]}, address, @latence1 ]

    address = "www.facebook.com.br"
    rtts = []
    for i in 1..5
      result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
      rtts.push(result)
    end
    @latence2 = rtts.sum/rtts.length

    @data2 = {1 => rtts[0], 2 => rtts[1], 3 => rtts[2], 4 => rtts[3], 5 => rtts[4]}

    address = "www.youtube.com.br"
    rtts = []
    for i in 1..5
      result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
      rtts.push(result)
    end
    @latence3 = rtts.sum/rtts.length

    @data3 = {1 => rtts[0], 2 => rtts[1], 3 => rtts[2], 4 => rtts[3], 5 => rtts[4]}
    

    address = "www.globo.com"
    rtts = []
    for i in 1..5
      result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
      rtts.push(result)
    end
    @latence4 = rtts.sum/rtts.length

    @data4 = {1 => rtts[0], 2 => rtts[1], 3 => rtts[2], 4 => rtts[3], 5 => rtts[4]}




  end
end
