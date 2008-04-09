class Thermal < Widget
  description "ACPI Thermal readings"
  option :cpu, "CPU", 0
  option :tempdirectory, "Directory where temperature file is located", "/sys/bus/platform/drivers/coretemp"
  field :temperature, "ACPI temperature", 0
  default "@temperature"

  init do
    tempfile = "#{@tempdirectory}/coretemp.#{@cpu}/temp1_input"
    lines = ::File.readlines(tempfile).map { |line| line.chomp } 
    @temperature = lines.first || ""
  end
end
