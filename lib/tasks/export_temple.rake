# -- coding: utf-8

require "open-uri"
require "rubygems"
require "nokogiri"
# require "pry"
require 'csv'

def open_page(name, url)
    html = open(url) do |f|
      f.read
    end
    doc = Nokogiri::HTML.parse(html, nil, "utf-8")
    data = {}
    doc.xpath('//*[@id="mw-content-text"]/table[1]').each do |node|
        begin
            data = {
                'name' => name,
                'url' => url,
                'img_src' => "http:#{node.xpath('tr').xpath('td').children[0].children[0].attributes['src'].value}",
                'address' => node.xpath('tr').xpath('td').children[3].text,
                'geo' => node.xpath('tr').xpath('td').children[4].text,
                'description' => doc.xpath('//*[@id="mw-content-text"]/p')[0].text
            }
        rescue => e
            print e
            data['img_src'] = ""
        end
    end
    data
end

namespace :export_temple do
    desc "Export temple data"

    task :export => :environment do
        read_file = "#{Rails.root.to_s}/tmp/output_tera.csv"
        puts read_file
        CSV.foreach(read_file) do |row|
            sleep 1
            name = row[0]
            url = row[1]
            data = open_page(name, url)
            print data
            # save data
            place = Place.new
            place.name = data['name']
            place.url = data['url']
            place.img_src = data['img_src']
            place.address = data['address']
            place.description = data['description']
            place.save
            sleep 1
        end
    end

    desc "Download temple data"
    task :download => :environment do
        Place.all.each do |p|
            puts "#{p.id},#{p.name},#{p.url}"
        end
    end
end
