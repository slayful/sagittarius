use "time"

primitive MillisPerSecond  fun apply(): U32 => 1_000
primitive NanosPerSecond  fun apply(): U32 => 1_000_000_000
primitive NanosPerMilli  fun apply(): U32 => 1_000_000
primitive SecondsPerMinute  fun apply(): U16 => 60

primitive TimeUtilities

  fun millis_now(): I64 val =>
    // TODO, only seconds are accounted for, add more precision
    Time.now()._1

  fun seconds_and_nanos_to_millis(seconds: I32, nanos: U32): I64 =>
    let nanos_in_millis: I64 = nanos.i64() / NanosPerMilli().i64()
    if (seconds < 0) and (nanos != 0) then
        let millis: I64 = (seconds + 1).i64() * MillisPerSecond().i64()
        let adjustment: I64 = nanos_in_millis.i64() - MillisPerSecond().i64()
        millis + adjustment
    else
        let millis: I64 = seconds.i64() * MillisPerSecond().i64()
        millis + nanos_in_millis
    end
