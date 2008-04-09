#!/usr/bin/env ruby
#
#
# status line for dwm

require 'date'
require 'sys/cpu'
require 'mpd'
require 'find'

BITMAPS='/home/gig/.awesome/transicons/'

def time
  Time::now.strftime('%H:%M:%S %Y.%m.%d')
end

def system
  final = ''
  for load in Sys::CPU.load_avg
    load = (load*100).round.to_f / 100
    final += "#{load} "
  end
  final
end

def battery
  state = IO.readlines("/proc/acpi/battery/BAT0/state")
  info = IO.readlines("/proc/acpi/battery/BAT0/info")
  stat = state[2].split(/\s+/)[2]
  dir = ''
  if stat == "charging"
	dir = '^'
  elsif stat == "discharging"
	dir = 'v'
  else
	dir = '='
  end

  percent = ( state[4].split(/\s+/)[2].to_i * 100 ) / info[2].split(/\s+/)[3].to_i 
  
  return dir+percent.to_s+dir
end

def mail
  final = ''
  mailcount = 0
  Find.find('/home/gig/.mail/default/new') do |path|
	if not FileTest.directory?(path)
	  mailcount += 1
	end
  end
  final += "#{mailcount}"
  final
end


$mpdserv = MPD.new
def mpd ()
  final = ''
  begin
	# add music data
	mpdserv_status = $mpdserv.status["state"]
	case mpdserv_status
	  when 'play' : text = ">>: "; show_info = true
	  when 'pause': text = "||: "; show_info = true
	  else show_info = false
	end
	if show_info
	  title = $mpdserv.strf("%t")
	  author = $mpdserv.strf("%a")
	  final = final + text + "#{author} - #{title} " + $mpdserv.strf("(%e/%l)")
	else   # Player is stopped or connection not yet initialized...
	  final = final + "[]: not playing"
	end
	
  rescue EOFError
	final = final + "!!: mpd - error"
	$mpdserv = MPD.new
  end
  final
end

def run()
  final = ''
  
	# the date ex:	2006.12.05 13:44:20
  final += time() + " "
  
	# add load ex: 0.25 0.34 0.27
  final += system() + " "
	
	# add batery ex: ^
  final += battery() + ' '

	# mail status
  final += mail() + " "
  
	# music stats
  final += mpd() + " "
  final  
end

while true do
  begin
	puts run()
	$stdout.flush
	# don't ridiculous loop!
	sleep 1.0
  rescue StandardError => err
	puts "Error!"
	$stdout.flush
  rescue Exception => exp
	puts "Exception!"
	$stdout.flush
  end
end
