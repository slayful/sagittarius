class val Duration is (Equatable[Duration] & Stringable)

  let _milliseconds: ILong val

  new val from_millis(milliseconds: ILong val) =>
      _milliseconds = milliseconds

  fun string(): String iso^ =>
    String.join([
      "Duration of "
      _milliseconds.string()
      " milliseconds."
    ].values())

  fun millis(): ILong val =>
    _milliseconds

  fun add(duration: Duration val): Duration val =>
    Duration.from_millis(millis() + duration.millis())

  fun sub(duration: Duration val): Duration val =>
    Duration.from_millis(millis() - duration.millis())

  fun box eq(that: Duration box): Bool val =>
    this.millis() == that.millis()
