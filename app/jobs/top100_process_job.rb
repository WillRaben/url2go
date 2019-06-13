class Top100ProcessJob < ApplicationJob
require 'open-uri'
include LongUrisHelper
  queue_as :default

  def perform(*args)
    # Do something later
    top100_array = []
     url_array = LongUri.order(hits: :desc).take(100)
     url_array.each do |element|
     	url = i_to_protocol(element.protocol_id)+(element.org_url)
     	title = open(url).read.scan(/<title>(.*?)<\/title>/) 
     	top100_array.push (TopHit.new({
     		:title => title,
     		:short_url => element.short_url,
     		:hits => element.hits}))
     end
     top100_array.reverse.each { |obj|  obj.save }
  end
  	
end
