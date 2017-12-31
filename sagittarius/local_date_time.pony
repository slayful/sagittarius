class val LocalDateTime

  let _date: LocalDate val
  let _time: LocalTime val

  new from_millis(millis: I64 val) =>
    //TODO
    _date = LocalDate(1970, 1, 1)
    _time = LocalTime(0, 0, 0, 0)

  fun get_years(): I32 =>
    _date.get_years()

  fun get_months(): I32 =>
    _date.get_months()

  fun get_days(): I32 =>
    _date.get_days()

  fun get_hours(): I32 =>
    _time.get_hours()

  fun get_minutes(): I32 =>
    _time.get_minutes()

  fun get_seconds(): I32 =>
    _time.get_seconds()

  fun get_nanos(): I32 =>
    _time.get_nanos()
