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
    h.assert_eq[I64](400, four_hundred_millis.to_millis())

    let three_hundred_milis = Duration.from_millis(300)
    h.assert_eq[I64](300, three_hundred_milis.to_millis())

    // sum of two Durations
    let sum = four_hundred_millis + (three_hundred_milis)
    h.assert_eq[I64](700, sum.to_millis())

    // positive difference
    let diff = four_hundred_millis - (three_hundred_milis)
    h.assert_eq[I64](100, diff.to_millis())

    // negative difference
    let negative_diff = three_hundred_milis - (four_hundred_millis)
    h.assert_eq[I64](-100, negative_diff.to_millis())

    // negative difference
    let minus_one_hundred_milis = Duration.from_millis(-100)
    h.assert_eq[Duration](minus_one_hundred_milis, negative_diff)

class iso _TestLocalDateTime is UnitTest
  fun name(): String => "local_date_time"

  fun apply(h: TestHelper) =>
    // 2012-02-28T00:00:00
    // 2012-02-29T00:00:00

    // 1970-01-01T00:00:00
    let zero_millis = LocalDateTime.from_millis(0)
    h.assert_eq[I32](1970, zero_millis.get_years())
    h.assert_eq[I32](1, zero_millis.get_months())
    h.assert_eq[I32](1, zero_millis.get_days())
    h.assert_eq[I32](0, zero_millis.get_hours())
    h.assert_eq[I32](0, zero_millis.get_minutes())
    h.assert_eq[I32](0, zero_millis.get_seconds())
    h.assert_eq[I32](0, zero_millis.get_nanos())
