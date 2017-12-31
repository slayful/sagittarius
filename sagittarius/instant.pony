class val Instant is (Equatable[Instant] & Stringable)

  /** The values since 1970-01-01T00:00:00Z */
  let _seconds: I32 val
  let _nanos: U32 val

  new val create(seconds: I32 val, nanos: U32 val) =>
    _seconds = seconds
    _nanos = nanos

  new val from_millis(millis: U32 val) =>
    _seconds = millis.i32() / 1000
    _nanos = (millis % 1000) * 1000_000

  fun string(): String iso^ =>
    String.join([
      "Instance of "
      _seconds.string()
      " seconds and "
      _nanos.string()
      " nanoseconds since 1970-01-01T00:00:00Z."
    ].values())

  fun get_seconds(): I32 val =>
    _seconds

  fun get_nanos(): U32 val =>
    _nanos

  fun to_millis(): I64 val =>
    TimeUtilities.seconds_and_nanos_to_millis(_seconds, _nanos)

  fun add(duration: Duration val): Instant val =>
    add_seconds_and_nanos(duration.get_seconds(), duration.get_nanos().i32())

  fun add_seconds_and_nanos(seconds: I32, nanos: I32): Instant val =>
    if (seconds == 0) and (nanos == 0) then
      // TODO just return this
      Instant(
          get_seconds(),
          get_nanos()
        )
    else
      let nanos_sum: I64 = this.get_nanos().i64() + nanos.i64()
      Instant(
        get_seconds() + seconds + (nanos_sum / NanosPerSecond().i64()).i32(),
        // TODO this is wrong if nanos are negative
        get_nanos() + nanos.u32() + (nanos_sum % NanosPerSecond().i64()).u32()
      )
    end

  fun sub(duration: Duration val): Instant val =>
    add_seconds_and_nanos(-1 * duration.get_seconds(), -1 * duration.get_nanos().i32())

  fun box eq(that: Instant box): Bool val =>
    (this.get_seconds() == that.get_seconds())
    and (this.get_nanos() == that.get_nanos())
