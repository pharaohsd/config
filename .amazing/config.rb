# Gigamo <gigamo@gmail.com> (29/04/08)
#
# Configuration file for amazing (http://github.com/dag/amazing)
# Only works with amazing's 'config' branch and awesome's awesome-3 branch.
import "#{ENV["HOME"]}/.passwords.rb" # GMAIL_PWD

BLINK = {}

module Helpers::PangoMarkup
  def urgent(text)
    foreground("#ff5656", text)
  end
  def normal(text)
    foreground("#888888", text)
  end
  def white(text)
    foreground("#ffffff", text)
  end
end

awesome {
  set :statusbar => "top"

  widget("battery") {
    set :interval => 10

    property("text") {
      dir = ""
      if @state == :charging
        dir = "^"
      elsif @state == :discharging
        dir = "v"
      else
        dir = "="
      end

      if @percentage <= 20
        urgent(" #{dir}#{@percentage.to_i}#{dir} ")
      else
        normal(" #{dir}#{@percentage.to_i}#{dir} ")
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
    #set :module => :sup
    set :username => "gigamo"
    set :password => GMAIL_PWD

    property("text") {
#      # Make the widget blink upon new mail!
#      BLINK[@identifier] ||= []
#      if @count > 0
#        if BLINK[@identifier].empty?
#          BLINK[@identifier] << IO.popen("#{ENV["HOME"]}/bin/blink.rb 1.0 0 top #@identifier text '#{urgent(" #@count")}' '#{normal(" #@count")}'")
#        end
#      else
#        BLINK[@identifier].each do |blinker|
#          Process.kill("SIGINT", blinker.pid)
#        end
#      end
#
#      normal(" #@count")
      if @count > 0
        urgent(" #@count")
      else
        normal(" #@count")
      end
    }
  }

  widget("pacman") {
    set :interval => 1.hours

    property("text") { 
      if @count > 0
        urgent(" #@count ")
      else
        normal(" #@count ")
      end
    }
  }

  widget("clock") {
    set :interval => 1
    set :format => " %T %d.%m.%Y "
  }

  widget("cpu_usage") {
    set :interval => 2

    property("text") { 
      if @usage[0].to_i >= 50
        urgent(" #{@usage[1].to_i}%/#{@usage[2].to_i}% ")
      else
        white(" #{@usage[1].to_i}%/#{@usage[2].to_i}% ")
      end
    }
  }

  widget("cpu_freq") {
    set :module => :cpu_info
    set :interval => 3

    property ("text") {
      ghz = @speed[0] / 1000
      if @speed[0] >= 1000
        urgent("@ %3.2fGHz " % ghz)
      else 
        normal("@ #{@speed[0].to_i}MHz ")
      end
    }
  }
}
