use "ponytest"

actor Main is TestList
  new create(env: Env) => PonyTest(env, this)
  new make() => None


fun tag tests(test: PonyTest) =>
  test(_TestDuration)
  test(_TestLocalDateTime)


class iso _TestDuration is UnitTest
  fun name(): String => "duration"

  fun apply(h: TestHelper) =>
    let four_hundred_millis = Duration.from_millis(400)
    h.assert_eq[ILong](400, four_hundred_millis.millis())

    let three_hundred_milis = Duration.from_millis(300)
    h.assert_eq[ILong](300, three_hundred_milis.millis())

    // sum of two Durations
    let sum = four_hundred_millis + (three_hundred_milis)
    h.assert_eq[ILong](700, sum.millis())

    // positive difference
    let diff = four_hundred_millis - (three_hundred_milis)
    h.assert_eq[ILong](100, diff.millis())

    // negative difference
    let negative_diff = three_hundred_milis - (four_hundred_millis)
    h.assert_eq[ILong](-100, negative_diff.millis())

    // negative difference
    let minus_one_hundred_milis = Duration.from_millis(-100)
    h.assert_eq[Duration](minus_one_hundred_milis, negative_diff)

class iso _TestLocalDateTime is UnitTest
  fun name(): String => "local_date_time"

  fun apply(h: TestHelper) =>
    // 1970-01-01T00:00:00
    let zero_millis = LocalDateTime.from_millis(0)
    h.assert_eq[I32](1970, zero_millis.year())
    h.assert_eq[I32](1, zero_millis.month_of_year())
    h.assert_eq[I32](1, zero_millis.day_of_month())
    h.assert_eq[I32](0, zero_millis.hour_of_day())
    h.assert_eq[I32](0, zero_millis.minute_of_hour())
    h.assert_eq[I32](0, zero_millis.second_of_minute())
    h.assert_eq[I32](0, zero_millis.millis_of_second())
