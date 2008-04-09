class Wifi < Widget
  description "Various wireless interface information"
  option :iface, "Interface", "wlan0"
  field :essid, "Associated ESSID", ""
  field :mode, "Wireless mode", ""
  field :ap, "Associated access point mac address", ""
  field :bitrate, "Connection bitrate in Mb/s", 0
  field :quality, "Connection quality percentage", 0
  field :signal, "Signal level", 0
  field :noise, "Noise level", 0
  default "@quality"

  init do
    IO.popen("iwconfig #{@iface}") do |iwconfig_p|
        iwconfig = iwconfig_p.readlines.to_s
        @essid = iwconfig.scan(/ESSID:"([^"]*)"/).to_s
        @mode = iwconfig.scan(/Mode:(\S+)/).to_s
        @ap = iwconfig.scan(/Access Point: (\S+)/).to_s
        @bitrate = iwconfig.scan(/Bit Rate:(\S+)/).to_s.to_i
        qual = iwconfig.scan(/Link Quality=(\d+)\/(\d+)/)[0]
        @quality = (qual[0].to_i * 100) / qual[1].to_i
        @signal = iwconfig.scan(/Signal level=(\S+)/).to_s.to_i
        @noise = iwconfig.scan(/Noise level=(\S+)/).to_s.to_i
    end
  end
end
