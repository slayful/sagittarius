class val Instant is (Equatable[Instant] & Stringable)

  /** The values since 1970-01-01T00:00:00Z */
  let _seconds: I32 val
  let _nanos: U32 val

  new val create(seconds: I32 val, nanos: U32 val) =>
    _seconds = seconds
    _nanos = nanos

  new val from_millis(millis: I64 val) =>
    let nanos_adjustment = millis % MillisPerSecond().i64()
    if nanos_adjustment < 0 then
      _seconds = (millis / MillisPerSecond().i64()).i32() - 1
      _nanos = (nanos_adjustment + MillisPerSecond().i64()).u32() * NanosPerMilli().u32()
    else
      _seconds = (millis / MillisPerSecond().i64()).i32()
      _nanos = nanos_adjustment.u32() * NanosPerMilli().u32()
    end

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
    add_seconds_and_nanos(duration.get_seconds(), duration.get_nanos().i64())

  fun add_seconds_and_nanos(seconds: I32, nanos: I64): Instant val =>
    if (seconds == 0) and (nanos == 0) then
      // TODO just return this
      Instant(
          get_seconds(),
          get_nanos()
        )
    else
      let nanos_sum: I64 = get_nanos().i64() + nanos
      let seconds_in_nanos: I64 = nanos_sum / NanosPerSecond().i64()
      if nanos_sum < 0 then
          Instant(
            (get_seconds().i64() + seconds.i64() + (seconds_in_nanos.i64() - 1)).i32(),
            (NanosPerSecond().i64() - (nanos_sum % NanosPerSecond().i64())).u32()
          )
        else
          Instant(
            get_seconds() + seconds + seconds_in_nanos.i32(),
            (nanos_sum % NanosPerSecond().i64()).u32()
          )
      end

    end

  fun sub(duration: Duration val): Instant val =>
    add_seconds_and_nanos(-1 * duration.get_seconds(), -1 * duration.get_nanos().i64())

  fun box eq(that: Instant box): Bool val =>
    (this.get_seconds() == that.get_seconds())
    and (this.get_nanos() == that.get_nanos())
