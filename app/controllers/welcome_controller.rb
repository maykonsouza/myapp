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

    
  end
end
