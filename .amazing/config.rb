# Gigamo <gigamo@gmail.com> (18/04/08)
# Configuration file for amazing (http://github.com/dag/amazing)
import "../.passwords.rb" # GMAIL_PWD in there

urgent_color = "#ff5656"
normal_color = "#a0a0a0"

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
        urgent_color
      else
        normal_color
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
        urgent_color
      else
        normal_color
      end
    }
  }

  widget("pacman") {
    property("text") {
      " #@count "
    }
    property("fg") {
      if @count > 0
        urgent_color
      else
        normal_color
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
        urgent_color
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
        urgent_color
      else
        normal_color
      end
    }
  }
}
