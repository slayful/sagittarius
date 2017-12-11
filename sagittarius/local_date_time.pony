class val LocalDateTime

  let _instant: Instant val

  new val from_millis(milliseconds: ILong val) =>
    _instant = Instant.from_millis(milliseconds)

  fun year(): I32 =>
    1970

  fun month_of_year(): I32 =>
    1

  fun day_of_month(): I32 =>
    1

  fun hour_of_day(): I32 =>
    0

  fun minute_of_hour(): I32 =>
    0

  fun second_of_minute(): I32 =>
    0

  fun millis_of_second(): I32 =>
    0
