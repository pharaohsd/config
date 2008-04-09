class MemTotal < Widget
  description "Various memory related data"
  field :total, "Total kilobytes of memory"
  field :free, "Free kilobytes of memory"
  field :buffers, "Buffered kilobytes of memory"
  field :cached, "Cached kilobytes of memory"
  field :usage, "Percentage of used memory"
  field :usagetotal, "Percentage of used memory including cache and buffers"
  field :swap_total, "Total kilobytes of swap"
  field :swap_free, "Free kilobytes of swap"
  field :swap_cached, "Cached kilobytes of swap"
  field :swap_usage, "Percentage of used swap"
  field :swap_usagetotal, "Percentage of used swap including cache"
  default { @usage.to_i }

  init do
    meminfo = ProcFile.parse_file("meminfo")[0]
    @total = meminfo["MemTotal"].to_i
    @free = meminfo["MemFree"].to_i
    @buffers = meminfo["Buffers"].to_i
    @cached = meminfo["Cached"].to_i
    @usage = ((@total - @free - @cached - @buffers) * 100) / @total.to_f
    @usagetotal = ((@total - @free) * 100) / @total.to_f
    @swap_total = meminfo["SwapTotal"].to_i
    @swap_free = meminfo["SwapFree"].to_i
    @swap_cached = meminfo["SwapCached"].to_i
    @swap_usage = ((@swap_total - @swap_free - @swap_cached) * 100) / @swap_total.to_f
    @swap_usagetotal = ((@swap_total - @swap_free) * 100) / @swap_total.to_f
  end
end
