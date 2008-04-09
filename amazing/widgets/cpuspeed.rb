class CPUSpeed < Widget
  description "CPU Speed information"
  option :cpu, "CPU number (0 based)", 0
  field :speed, "CPU Speed in MHz", 0
  default "@speed"

  init do
      cpuinfo = ProcFile.parse_file("cpuinfo")[@cpu]
      @speed = cpuinfo["cpu MHz"].to_f
  end
end
