class val Duration is (Equatable[Duration] & Stringable)

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
      "Duration of "
      _seconds.string()
      " seconds and "
      _nanos.string()
      " nanos."
    ].values())

  fun get_seconds(): I32 val =>
    _seconds

  fun get_nanos(): U32 val =>
    _nanos

  fun to_millis(): I64 val =>
    TimeUtilities.seconds_and_nanos_to_millis(_seconds, _nanos)

  fun add(that: Duration val): Duration val =>
    Duration(
      this.get_seconds() + that.get_seconds(),
      this.get_nanos() + that.get_nanos()
    )

  fun sub(that: Duration val): Duration val =>
    Duration(
      this.get_seconds() - that.get_seconds(),
      this.get_nanos() - that.get_nanos()
    )

  fun box eq(that: Duration box): Bool val =>
    (this.get_seconds() == that.get_seconds())
    and (this.get_nanos() == that.get_nanos())
