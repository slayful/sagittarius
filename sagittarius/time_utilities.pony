use "time"

primitive TimeUtilities

  fun milis_now(): ILong val =>
    // TODO, only seconds are accounted for, add more precision
    ILong.from[I64](Time.now()._1)
