class Top100ProcessJob < ApplicationJob
require 'net/http'
include LongUrisHelper
  queue_as :default

  def perform(*args)
    url_array = LongUri.order(hits: :desc).take(100)
    url_array.each do |element|
    url = i_to_protocol(element.protocol_id)+(element.org_url)
      begin
          puts "HITTING: " + url #for production demostration only, --remove
          title = Net::HTTP.get(URI.parse(url)).scan(/<title>(.*?)<\/title>/).first.flatten.join.slice(0,140)
        rescue SocketError => err
          puts "ERROR: #{err.message}"
          title = "Error: Link appears to malformed"
          next
        rescue Net::OpenTimeout => err
          puts "ERROR: #{err.message}"
          title = "Error: Link appears to be down"
          next
        rescue Errno::ECONNREFUSED => err
          title = "Error: Connection Refuse by host"
          next
        rescue Exception => err
          puts "ERROR: #{err.message}"
          title = "ERROR: #{err.message}"
          next
      end
      hit = TopHit.where(short_url: element.short_url).first_or_initialize
      hit.title = title
      hit.hits = element.hits
      hit.save!
    end
  end
end