class PagesController < ApplicationController
  def home

    redis = Redis.new(host: "redis", port: 6379)
    redis.incr "page hits"

    @page_hits = redis.get "page hits"

    @response = system("ping -c1 8.8.8.8")

    
    @ping_time = `ping -c 3 www.pintile.com | tail -1| awk '{print $4}' | cut -d '/' -f 2`
    


    address = "www.pintile.com"
    rtts = []
    for i in 1..5
      result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
      rtts.push(result)
    end
    @latence = rtts.sum/rtts.length

    @rtts_=rtts


    address = "www.google.com"
    rtts = []
    for i in 1..5
      result = `ping -c 3 #{address} | tail -1| awk '{print $4}' | cut -d '/' -f 2`.to_i
      rtts.push(result)
    end
    @latence = rtts.sum/rtts.length

    @rtts_1=rtts



  end
end
