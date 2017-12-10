class val Duration

  let _milliseconds: ULong val

  new val from_millis(milliseconds: ULong) =>
      _milliseconds = milliseconds

  fun get_millis(): ULong val =>
    _milliseconds

  fun plus(duration: Duration val): Duration val =>
    Duration.from_millis(get_millis() + duration.get_millis())

  fun minus(duration: Duration val): Duration val =>
    Duration.from_millis(get_millis() - duration.get_millis())
