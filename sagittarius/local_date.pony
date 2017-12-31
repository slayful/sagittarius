class val LocalDate

  let _years: I32 val
  let _months: I32 val
  let _days: I32 val

  new val create(years: I32 val, months: I32 val, days: I32 val) =>
    _years = years
    _months = months
    _days = days

  fun get_years(): I32 =>
    _years

  fun get_months(): I32 =>
    _months

  fun get_days(): I32 =>
    _days
