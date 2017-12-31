use "time"

primitive TimeUtilities

  fun millis_now(): I64 val =>
    // TODO, only seconds are accounted for, add more precision
    Time.now()._1

  fun seconds_and_nanos_to_millis(seconds: I32, nanos: U32): I64 =>
    let nanos_in_millis: I64 = I64.from[U32](nanos / 1000_000)
    if (seconds < 0) and (nanos != 0) then
        let millis: I64 = I64.from[I32]((seconds + 1) * 1000)
        let adjustment: I64 = nanos_in_millis - 1000
        millis + adjustment
    else
        let millis: I64 = I64.from[I32](seconds * 1000)
        millis + nanos_in_millis
    end
