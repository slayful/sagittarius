use "format"

class val LocalDate is (Equatable[LocalDate] & Stringable)

  let _years: I32 val
  let _months: I32 val
  let _days: I32 val

  new val from_epoch_day(days: I64) =>
    // let zeroDay = DaysSinceEpoch() - days
    // let yearEst = ((400 * zeroDay) + 591) / DaysPer400YearCycle()
    // let dayEst = zeroDay - ((((365 * yearEst) + (yearEst / 4)) - (yearEst / 100)) + (yearEst / 400))
    // let monthEst = dayEst % 12

    // _years = yearEst
    // _months = monthEst
    // _days = dayEst / 12
    _years = 1970
    _months = 1
    _days = 1

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

  fun box eq(that: LocalDate box): Bool val =>
    (this.get_years() == that.get_years())
    and (this.get_months() == that.get_months())
    and (this.get_days() == that.get_days())

  fun string(): String iso^ =>
    String.join([
      Format.int[I32](get_years() where width = 4, fill='0')
      "-"
      Format.int[I32](get_months() where width = 2, fill='0')
      "-"
      Format.int[I32](get_days() where width = 2, fill='0')
    ].values())
