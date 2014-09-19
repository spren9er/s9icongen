#!/usr/bin/ruby
# encoding : utf-8

require 'rubygems'
require 'RMagick'
include Magick

# arguments processing
if ARGV.empty?
  puts 'no arguments given'
  exit 
else
  img_name = ARGV[0]
  unless File.exists?(img_name)
    puts "no file named #{img_name}"
    exit 
  end
end

device = (ARGV.count > 1 ? ARGV[1] : 'iphone')
img = ImageList.new(img_name)

# only iOS 7.0 and above
sizes = [{
      idiom: 'iphone settings',
      size: 29,
      scale: 1},
      {
      idiom: 'iphone settings',
      size: 29,
      scale: 2},
      {
      idiom: 'iphone settings',
      size: 29,
      scale: 3},
      {
      idiom: 'iphone spotlight',
      size: 40,
      scale: 2},
      {
      idiom: 'iphone spotlight',
      size: 40,
      scale: 3},
      {
      idiom: 'iphone app',
      size: 60,
      scale: 2},
      {
      idiom: 'iphone app',
      size: 60,
      scale: 3},
      {
      idiom: 'ipad settings',
      size: 29,
      scale: 1},
      {
      idiom: 'ipad settings',
      size: 29,
      scale: 2},
      {
      idiom: 'ipad spotlight',
      size: 40,
      scale: 1},
      {
      idiom: 'ipad spotlight',
      size: 40,
      scale: 2},
      {
      idiom: 'ipad app',
      size: 76,
      scale: 1},
      {
      idiom: 'ipad app',
      size: 76,
      scale: 2}]

def log(size, filename)
  s = "#{size}x#{size}"
  s.insert(0, ' '*(9 - s.length))
  puts "#{s}: #{filename}"
end

system('rm icons/*.png')
system('rm icons/iTunesArtwork')
sizes.each do |s|
  if device == 'universal' || s[:idiom].start_with?(device)
    size = s[:scale]*s[:size]
    scaled_img = img.resize_to_fit(size, size)
    filename = 'icons/' + (s[:scale] > 1 ? "Icon-#{s[:size]}@#{s[:scale]}x.png" : "Icon-#{s[:size]}.png")
    log(size, filename)
    scaled_img.write(filename)
  end
end

# CarPlay
scaled_img = img.resize_to_fit(120, 120)
log(120, 'icons/Icon-120.png')
scaled_img.write('icons/Icon-120.png')

# iTunesArtwork
scaled_img = img.resize_to_fit(1024, 1024)
log(1024, 'icons/iTunesArtwork')
scaled_img.write('icons/iTunesArtwork.png')
`mv icons/iTunesArtwork.png icons/iTunesArtwork`