class val Instant is (Equatable[Instant] & Stringable)

  /** The milliseconds since 1970-01-01T00:00:00Z */
  let _milliseconds: ILong val

  new val from_millis(milliseconds: ILong val) =>
      _milliseconds = milliseconds

  fun string(): String iso^ =>
    String.join([
      "Instance of "
      _milliseconds.string()
      " milliseconds since 1970-01-01T00:00:00Z."
    ].values())

  fun millis(): ILong val =>
    _milliseconds

  fun add(duration: Duration val): Instant val =>
    Instant.from_millis(millis() + duration.millis())

  fun sub(duration: Duration val): Instant val =>
    Instant.from_millis(millis() - duration.millis())

  fun box eq(that: Instant box): Bool val =>
    this.millis() == that.millis()
