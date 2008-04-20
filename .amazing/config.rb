# Gigamo <gigamo@gmail.com> (20/04/08)
#
# Configuration file for amazing (http://github.com/dag/amazing)
# Only works with amazing's 'config' branch.
import "#{ENV["HOME"]}/.passwords.rb" # GMAIL_PWD

BLINK = {}
COLOR = { :urgent => "#ff5656",
          :normal => "#a0a0a0" }

awesome {
  set :statusbar => "top"

  widget("battery") {
    set :interval => 10

    property("text") {
      case @state 
        when :charging : DIR = "^"
        when :discharging : DIR = "v"
        else DIR = "="
      end
      " #{DIR}#{@percentage.to_i}#{DIR} "
    }

    property("fg") {
      if @percentage <= 20
        COLOR[:urgent]
      else
        COLOR[:normal]
      end
    }
  }

  widget("alsa") {
    set :property => "data master"
    set :interval => 1.minutes
  }

  widget("mpd") {
    set :interval => 1

    property("text") {
      case @state
        when :playing : TEXT = ">>:"; show_info = true
        when :paused : TEXT = "||:"; show_info = true
        else show_info = false
      end
      if show_info
        " #{TEXT} #@artist - #@title (#@position/#@length) "
      else # Player is stopped or connection not initialized
        " []: not playing "
      end
    }
  }

  widget("gmail") {
    set :interval => 5.minutes
    set :username => "gigamo"
    set :password => GMAIL_PWD

    property("text") {
      if @count > 0
        BLINK[@identifier]
      end
      " #@count"
    }
  }

  # Make our gmail widget blink on new mails...
  widget("gmail") {
    set :module => :noop
    set :interval => 3
 
    property("fg") {
      if BLINK[@identifier] && @iteration % 2 == 0
        COLOR[:urgent]
      else
        COLOR[:normal]
      end
    }
  }

  widget("pacman") {
    set :interval => 1.hours

    property("text") {
      " #@count "
    }

    property("fg") {
      if @count > 0
        COLOR[:urgent]
      else
        COLOR[:normal]
      end
    }
  }

  widget("clock") {
    set :interval => 1
    set :format => " %H:%M:%S %d.%m.%Y "
  }

  widget("cpu_usage") {
    set :interval => 2

    property("text") {
      " #{@usage[1].to_i}%/#{@usage[2].to_i}% "
    }

    property("fg") {
      if @usage[0].to_i >= 50
        COLOR[:urgent]
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
        COLOR[:urgent]
      else
        COLOR[:normal]
      end
    }
  }
}
