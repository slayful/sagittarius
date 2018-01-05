use "format"

class val LocalDate is (Equatable[LocalDate] & Stringable)

  let _years: I32 val
  let _months: I32 val
  let _days: I32 val

  new val create(years: I32 val, months: I32 val, days: I32 val) =>
    _years = years
    _months = months
    _days = days

  new val from_epoch_day(days: I64) =>
    var zeroDay = DaysSinceEpoch().i64() + days
    // adjust to 0000-03-01 so leap day is at end of four year cycle
    zeroDay = zeroDay - 60

    let adjust = if zeroDay < 0 then
      // adjust negative years to positive for calculation
      let adjustCycles = ((zeroDay + 1) / DaysPer400YearCycle().i64()) - 1
      zeroDay = zeroDay - (adjustCycles * DaysPer400YearCycle().i64())
      adjustCycles * 400
    else
      0
    end

    var yearEst = ((400 * zeroDay) + 591) / DaysPer400YearCycle().i64()
    var dayEst: I64 = _day_estimate(zeroDay, yearEst)
    if dayEst < 0 then
        // fix estimate
        yearEst = yearEst - 1
        dayEst = _day_estimate(zeroDay, yearEst)
    end

    // reset any negative year
    yearEst = yearEst + adjust

    // convert march-based values back to january-based
    let marchMonth0 = ((dayEst * 5) + 2) / 153
    let month = ((marchMonth0 + 2) % 12) + 1
    let dom = dayEst - ((((marchMonth0 * 306) + 5) / 10) + 1)
    yearEst = yearEst + (marchMonth0 / 10)

    _years = yearEst.i32()
    _months = month.i32()
    _days = dom.i32() + 2

  fun tag _day_estimate(zero_day: I64 val, year_estimate: I64 val): I64 =>
    let x = 365 * year_estimate
    let y = year_estimate / 4
    let z = year_estimate / 100
    let w = year_estimate / 400
    zero_day - (((x + y) - z) + w)

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
