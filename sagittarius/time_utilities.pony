use "time"

primitive MillisPerSecond  fun apply(): U32 => 1_000
primitive NanosPerSecond  fun apply(): U32 => 1_000_000_000
primitive NanosPerMilli  fun apply(): U32 => 1_000_000
primitive SecondsPerMinute  fun apply(): U16 => 60

primitive TimeUtilities

  fun millis_now(): I64 val =>
    // TODO, only seconds are accounted for, add more precision
    Time.now()._1
