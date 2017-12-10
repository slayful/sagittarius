class val Duration

  let _milliseconds: ULong

  new from_millis(milliseconds': ULong) =>
      _milliseconds = milliseconds'

  fun get_millis(): ULong =>
    _milliseconds
