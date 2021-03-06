class Top100ProcessJob < ApplicationJob
self.queue_adapter = :sidekiq
require 'net/http'
require 'nokogiri'
include LongUrisHelper
  queue_as :default

  def perform(*args)
    url_array = LongUri.order(hits: :desc).take(100)
    url_array.each do |element|
      hit = TopHit.where(short_url: element.short_url).first_or_initialize
      unless hit.persisted?
        url = i_to_protocol(element.protocol_id)+(element.org_url)
          begin
              puts "HITTING: " + url # production demostration/debugging only, --remove
              title = Nokogiri::HTML(Net::HTTP.get(URI.parse(url))).title
              if !title || title.include?("301 Moved")
                url = i_to_protocol(element.protocol_id)+"www."+(element.org_url)
                puts "TRYING: " + url
                title = Nokogiri::HTML(Net::HTTP.get(URI.parse(url))).title
              end

            rescue SocketError => err
              puts "ERROR: #{err.message}"
              title = "Error: Link appears to malformed"
              next
            rescue Net::OpenTimeout => err
              puts "ERROR: #{err.message}"
              title = "Error: Link appears to be down"
              next
            rescue Errno::ECONNREFUSED => err
              title = "Error: Connection Refused by host"
              next
            rescue Exception => err
              puts "ERROR: #{err.message}"
              title = "ERROR: #{err.message}"
              next
        end
        if !hit.title? || hit.title.include?("301 Moved")
          hit.title = title
        end
        hit.hits = element.hits
        hit.save!
        title = nil
      else
        hit.hits = element.hits
        hit.save!
      end
    end
  end
end