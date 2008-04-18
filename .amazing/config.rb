# Gigamo <gigamo@gmail.com> (18/04/08)
# Configuration file for amazing (http://github.com/dag/amazing)
require 'ostruct'
import "../.passwords.rb" # GMAIL_PWD in there

colors = OpenStruct.new(
  :urgent => "#ff5656",
  :normal => "#a0a0a0"
)

awesome {
  set :statusbar => "top"

  widget("battery") {
    set :interval => 25

    property("text") {
      case @state
      when :charged
        " =#{@percentage.to_i}= "
      when :charging
        " ^#{@percentage.to_i}^ "
      when :discharging
        " v#{@percentage.to_i}v "
      end
    }

    property("fg") {
      if @percentage <= 25
        colors.urgent
      else
        colors.normal
      end
    }
  }

  widget("mpd") {
    set :interval => 1

    property("text") {
      case @state
      when :playing
        " >>: #@artist - #@title (#@position/#@length) "
      when :paused
        " ||: #@artist - #@title (#@position/#@length) "
      when :stopped
        " []: not playing "
      end
    }
  }

  widget("mail") {
    set :module => :gmail
    set :username => "gigamo"
    set :password => GMAIL_PWD

    property("text") {
      " #@count"
    }

    property("fg") {
      if @count > 0
        colors.urgent
      else
        colors.normal
      end
    }
  }

  widget("pacman") {

    property("text") {
      " #@count "
    }

    property("fg") {
      if @count > 0
        colors.urgent
      else
        colors.normal
      end
    }
  }

  widget("clock") {
    set :interval => 1
    set :format => " %H:%M:%S %d.%m.%Y "
  }

  widget("cpu_usage") {
    set :interval => 3

    property("text") {
      " #{@usage[1].to_i}%/#{@usage[2].to_i}% "
    }

    property("fg") {
      if @usage[0] >= 75
        colors.urgent
      else
        "#ffffff"
      end
    }
  }

  widget("cpu_freq") {
    set :module => :cpu_info
    set :interval => 3

    property ("text") {
      if @speed[0] >= 1000
        ghz = @speed[0] / 1000
        "@ %3.2fGHz " % ghz
      else
        "@ #{@speed[0].to_i}MHz "
      end
    }

    property("fg") {
      if @speed[0] >= 1000
        colors.urgent
      else
        colors.normal
      end
    }
  }
}
