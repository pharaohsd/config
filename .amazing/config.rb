# Gigamo <gigamo@gmail.com> (18/04/08)
# Configuration file for amazing (http://github.com/dag/amazing)
import "/home/gig/.passwords.rb" # GMAIL_PWD in there

awesome {

  set :statusbar => "top"

  widget("battery") {

    set :interval => 25
    
    property("text") {
      
      case @state
      when :charged
        text "=#{@percentage.to_i}="
      when :charging
        text "^#{@percentage.to_i}^"
      when :discharging
        text "v#{@percentage.to_i}v"
      end

    }

    property("fg") {

      if @percentage.to_i <= 25
        "#ff5656"
      else
        "#a0a0a0"
      end

    }
  }

  widget("mpd") {

    set :interval => 1

    property("text") {

      case @state
      when :playing
        text ">>: #@artist - #@title (#@position/#@length)"
      when :paused
        text "||: #@artist - #@title (#@position/#@length)"
      when :stopped
        text "[]: not playing"
      end

    }
  }

  widget("mail") {

    set :module => :gmail
    set :interval => 5.minutes
    set :username => "gigamo"
    set :password => GMAIL_PWD

    property("text") {

      " #@count"

    }

    property("fg") {

      if @count > 0
        "#ff5656"
      else
        "#ffffff"
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
        "#ff5656"
      else
        "#ffffff"
      end

    }
  }

  widget("clock") {

    set :interval => 1
    set :format => "%H:%M:%S %d.%m.%Y"

    property("text") {

      " #@time "

    }
  }

  widget("cpu_usage") {

    set :interval => 3

    property("text") {

      " #{@usage[1].to_i}%/#{@usage[2].to_i}% "

    }

    property("fg") {

      if @usage[0] >= 75
        "#ff5656"
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
        "#ff5656"
      else
        "#a0a0a0"
      end

    }
  }

}
