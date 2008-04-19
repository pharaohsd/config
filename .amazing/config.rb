# Gigamo <gigamo@gmail.com> (19/04/08)
# Configuration file for amazing (http://github.com/dag/amazing)
import "#{ENV["HOME"]}/.passwords.rb" # GMAIL_PWD in there

color = {
  :urgent => "#ff5656",
  :normal => "#a0a0a0"
}

awesome {
  set :statusbar => "top"

  widget("battery") {
    set :interval => 10

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
      if @percentage <= 20 && @iteration % 2 == 0
        color[:urgent]
      else
        color[:normal]
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
      when :playing
        " >>: #@artist - #@title (#@position/#@length) "
      when :paused
        " ||: #@artist - #@title (#@position/#@length) "
      when :stopped
        " []: not playing "
      end
    }
  }

  widget("gmail") {
    set :interval => 5.minutes
    set :username => "gigamo"
    set :password => GMAIL_PWD

    property("text") {
      " #@count"
    }

    property("fg") {
      if @count > 0 && @iteration % 2 == 0
        color[:urgent]
      else
        color[:normal]
      end
    }
  }

  widget("pacman") {
    set :interval => 1.hours

    property("text") {
      " #@count "
    }

    property("fg") {
      if @count > 0 && @iteration % 2 == 0
        color[:urgent]
      else
        color[:normal]
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
        color[:urgent]
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
        color[:urgent]
      else
        color[:normal]
      end
    }
  }
}
