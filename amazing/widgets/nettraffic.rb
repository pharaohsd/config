class NetTraffic < Widget
  description "Network traffic information"
  option :iface, "Network interface", "wlan0"
  option :max_up, "Max up", 150
  option :max_down, "Max down", 2300
  field :up, "Upload rate in kB/s", 0
  field :down, "Download rate in kB/s", 0
  field :uptotal, "Amount of data uploaded in kB/s", 0
  field :downtotal, "Amount of data downloaded in kB/s", 0
  field :percentage_up
  field :percentage_down
  default "@percentage_down"

  init do
    dev = ProcFile.parse_file("net/dev")[2][@iface].split
    first_down = dev[0].to_f
    first_up = dev[8].to_f
    sleep 1
    dev = ProcFile.parse_file("net/dev")[2][@iface].split
    second_down = dev[0].to_f
    second_up = dev[8].to_f
    @down = (second_down - first_down) / 1024
    @downtotal = second_down / 1024
    @up = (second_up - first_up) / 1024
    @uptotal = second_up / 1024
    @percentage_up = @up * 100 / @max_up
    @percentage_down = @down * 100 / @max_down
  end
end
