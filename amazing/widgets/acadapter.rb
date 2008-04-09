class ACAdapter < Widget
  description "AC Adapter status"
  field :status, "AC State", "off-line"
  option :adapter, "AC Adapter", "ACAD"
  default "@status"

  init do
      statefile = ProcFile.parse_file("acpi/ac_adapter/#{@adapter}/state")[0]
      @status = statefile["state"]
  end
end
