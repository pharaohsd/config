# Gigamo <gigamo@gmail.com> (23/04/08)
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
      # Set some hacky direction 'symbols'
      case @state 
        when :charging : dir = "^"
        when :discharging : dir = "v"
        else dir = "="
      end
      " #{dir}#{@percentage.to_i}#{dir} "
    }

    property("fg") {
      if @percentage <= 20 : COLOR[:urgent]
      else COLOR[:normal]
      end
    }
  }

  widget("mpd") {
    set :interval => 1

    property("text") {
      case @state
        when :playing : txt = ">>:"; show_info = true
        when :paused : txt = "||:"; show_info = true
        else show_info = false
      end
      if show_info
        " #{txt} #@artist - #@title (#@position/#@length) "
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
      # Make the widget blink upon new mail!
      BLINK[@identifier] ||= []
      if @count > 0
        if BLINK[@identifier].empty?
          BLINK[@identifier] << IO.popen("#{ENV["HOME"]}/bin/blink.rb 1.0 0 top #@identifier fg #{COLOR[:urgent]} #{COLOR[:normal]}")
        end
      else
        BLINK[@identifier].each do |blinker|
          Process.kill("SIGINT", blinker.pid)
        end
      end
      # The actual string that's displayed
      " #@count"
    }
  }

  widget("pacman") {
    set :interval => 1.hours

    property("text") { " #@count " }

    property("fg") {
      if @count > 0 : COLOR[:urgent]
      else COLOR[:normal]
      end
    }
  }

  widget("clock") {
    set :interval => 1
    set :format => " %T %d.%m.%Y "
  }

  widget("cpu_usage") {
    set :interval => 2

    property("text") { " #{@usage[1].to_i}%/#{@usage[2].to_i}% " }

    property("fg") {
      if @usage[0].to_i >= 50 : COLOR[:urgent]
      else "#ffffff"
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
      if @speed[0] >= 1000 : COLOR[:urgent]
      else COLOR[:normal]
      end
    }
  }
}
