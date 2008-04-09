class CPUUsage < Widget
  description "CPU Usage"
  option :cpu, "CPU number (0 based)", 0
  field :usage, "Percent of CPU in use", 0
  default "@usage"

  init do
    statfile = {}; ::File.readlines("/proc/stat").map { |e| e = e.split; statfile[e[0]] = e[1..-1] }
    cpu_line = statfile["cpu#{@cpu}"]
    first_idle = cpu_line[3].to_i
    first_sum = 0; cpu_line[0..5].each { |x| first_sum += x.to_i }
    sleep(1)
    statfile = {}; ::File.readlines("/proc/stat").map { |e| e = e.split; statfile[e[0]] = e[1..-1] }
    cpu_line = statfile["cpu#{@cpu}"]
    second_idle = cpu_line[3].to_i
    second_sum = 0; cpu_line[0..5].each { |x| second_sum += x.to_i }
    idle = second_idle - first_idle
    sum = second_sum - first_sum
    @usage = 100 - ((idle * 100) / sum.to_f)
  end
end
