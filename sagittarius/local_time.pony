class val LocalTime

  let _hours: I32 val
  let _minutes: I32 val
  let _seconds: I32 val
  let _nanos: I32 val

  new val create(hours: I32 val, minutes: I32 val, seconds: I32 val, nanos: I32 val) =>
    _hours = hours
    _minutes = minutes
    _seconds = seconds
    _nanos = nanos

  fun get_hours(): I32 =>
    _hours

  fun get_minutes(): I32 =>
    _minutes

  fun get_seconds(): I32 =>
    _seconds

  fun get_nanos(): I32 =>
    _nanos
